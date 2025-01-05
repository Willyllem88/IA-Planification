import re
import subprocess
from tkinter import filedialog
from collections import defaultdict

# Función para leer la salida de FF y filtrar las líneas relevantes
def read_ff_output(stdout):
    """
    Lee la salida estándar (stdout) generada por el ejecutable FF.
    Filtra y retorna las líneas que contienen las palabras clave: ADD_CONTENT, SET_DAY_UNIQUE, SET_DAY.

    Args:
        stdout (str): La salida del comando ejecutado, capturada como una cadena de texto.

    Returns:
        list: Una lista de cadenas que contienen las acciones relevantes de FF, con el prefijo "step    " eliminado de la primera línea.
    """
    # Inicializa una lista para almacenar las líneas que cumplen con la condición
    ff_output = []

    # Recorre las líneas buscando las palabras clave
    for line in stdout.split('\n'):
        if any(keyword in line for keyword in ['ADD_CONTENT', 'SET_DAY_UNIQUE', 'SET_DAY']):
            # Si encuentra alguna de las palabras clave, añade la línea completa a ff_output
            ff_output.append(line.strip())

    # Elimina el prefijo "step    " de la primera línea
    if ff_output:
        ff_output[0] = ff_output[0].strip("step    ")

    return ff_output


# Función para parsear el plan extraído de la salida de FF
def parse_plan(ff_output):
    """
    Parsea la salida filtrada de FF, organizando las acciones por día.

    Args:
        ff_output (list): Una lista de cadenas con las acciones filtradas de la salida de FF.

    Returns:
        defaultdict: Un diccionario que mapea los días (como cadenas) a listas de acciones planificadas.
    """
    # Utiliza defaultdict para crear automáticamente listas vacías para cada día
    plan_by_day = defaultdict(list)

    # Define patrones regulares para buscar las distintas acciones
    add_content_pattern = re.compile(r"ADD_CONTENT\s+(\w+)")
    set_day_unique_pattern = re.compile(r"SET_DAY_UNIQUE\s+(\w+)\s+(DAY\d+)")
    set_day_pattern = re.compile(r"SET_DAY\s+(\w+)\s+\w+\s+(DAY\d+)\s+\w+")

    # Procesa cada línea de la salida de FF
    for line in ff_output:
        line = line.strip()  # Elimina espacios extra al inicio y final de cada línea
        line = re.sub(r'^\d+: ', '', line)  # Elimina el número al principio de cada línea (ej. "1: ")

        # Intenta hacer match con cada tipo de acción usando expresiones regulares
        add_content_match = add_content_pattern.match(line)
        if add_content_match:
            content = add_content_match.group(1)
            continue

        set_day_unique_match = set_day_unique_pattern.match(line)
        if set_day_unique_match:
            content, day = set_day_unique_match.groups()
            plan_by_day[day].append(content)
            continue

        set_day_match = set_day_pattern.match(line)
        if set_day_match:
            content, day = set_day_match.groups()
            plan_by_day[day].append(content)

    return plan_by_day


# Función para mostrar el plan por día
def display_plan(plan_by_day):
    """
    Muestra el plan organizado por día.

    Args:
        plan_by_day (defaultdict): Un diccionario con el plan organizado por días.
    """
    print("Planificación por día:\n")
    for day, contents in sorted(plan_by_day.items()):
        print(f"{day}: {', '.join(contents)}")


# Bloque principal para ejecutar el script
if __name__ == '__main__':
    print("=" * 60)
    print("🚀 Bienvenido al Planificador de Contenidos de Redflix 🚀".center(50))
    print("=" * 60)
    print("\nSeleccione la versión del planificador que desea ejecutar:")
    print("\n📋 Opciones disponibles:")
    print(" [0] 🟢 Nivel Básico")
    print(" [1] 🟡 Extensión 1 (nivel básico + N predecesores)")
    print(" [2] 🟠 Extensión 2 (extensión 1 + paralelos)")
    print(" [3] 🔵 Extensión 3 (extensión 2 + 3 contenidos por día)")
    print(" [4] 🔴 Extensión 4 (extensión 2 + 200 min por día)")
    print("\n🔔 Nota: Escriba el número correspondiente a su elección.\n")
    print("=" * 60)

    decision = int(input("Ingrese el número de la extensión que desea ejecutar: "))
    domain_file = ""
    problem_file = ""

    options = {
        0: "./prototipos/nivel_basico/redflix0.pddl",
        1: "./prototipos/extension_1/redflix1.pddl",
        2: "./prototipos/extension_2/redflix2.pddl",
        3: "./prototipos/extension_3/redflix3.pddl",
        4: "./prototipos/extension_4/redflix4.pddl",
    }

    if decision in options:
        domain_file = options[decision]
        problem_file = filedialog.askopenfilename(
            initialdir=f"./prototipos/{domain_file.split('/')[-2]}/", 
            title="Seleccionar problema", 
            filetypes=[("PDDL files", "*.pddl")]
        )
    else:
        print("❌ Opción inválida.")
        exit()

    if decision < 4:
        print("Comando: ./ff.exe -o", domain_file, "-f", problem_file)
        result = subprocess.run(["./ff.exe", "-o", domain_file, "-f", problem_file], 
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    """
    #print("Escoja que desea ejecutar:")
    #print("[0] Fast Forward (FF)")
    #print("[1] Metric Fast Forward (MFF) Random Problem")
    #print("[2] Metric Fast Forward (MFF)")
    decision = int(input())

    if decision == 0:
    # Ejecuta el comando FF y captura su salida estándar (stdout)
        result = subprocess.run(["./ff.exe", "-o", "redflix.pddl", "-f", "redflix-problem.pddl"], 
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    elif decision == 1:
        create = input("Do you want to generate new random problem? (n/y): ")
        if create == "y":
            subprocess.run(["python3", "ExamplesGenerator.py"])
        choice = int(input("Choose a random problem to solve (1-5): "))
        redflix = f'./random_problems/problem_{choice}.pddl'
        print(redflix)
        result = subprocess.run(["./metricff.exe", "-o", "redflixExtensio4.pddl", "-f", redflix], 
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    else:
        result = subprocess.run(["./metricff.exe", "-o", "redflixExtensio4.pddl", "-f", "redflixExtensio4-problem.pddl"], 
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    """

    print(result.stdout)  # Muestra la salida de FF
    
    # Lee la salida de FF
    ff_output = read_ff_output(result.stdout)

    # Parsea el plan extraído de la salida de FF
    plan_by_day = parse_plan(ff_output)

    # Muestra el plan organizado por día
    display_plan(plan_by_day)
