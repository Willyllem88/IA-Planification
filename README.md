# **Redflix Planificador de Contenidos**

Este script proporciona un planificador de contenidos para el sistema **Redflix** utilizando **Fast Forward** (FF) y **Metric Fast Forward** (MFF). Permite ejecutar distintas extensiones del planificador y analizar los resultados generados por FF.

## **Requisitos**

- Python 3.x
- `FFinterpreter3.py` (para ejecutar el planificador).
- Archivos de dominio y problema en formato PDDL.
- FF y Metric FF ejecutables (`ff.exe` y `metricff.exe`).
- Tkinter para la selección de archivos de problema.

## **Uso**

1. Ejecuta el script:

   ```bash
   python3 FFinterpreter3.py
   ```

2. Selecciona una de las siguientes opciones del planificador:
   - **Nivel Básico**: Planificación estándar.
   - **Extensión 1**: Añade predecesores.
   - **Extensión 2**: Planificación con acciones paralelas.
   - **Extensión 3**: 3 contenidos por día.
   - **Extensión 4**: 200 minutos por día.

3. Si seleccionas la **Extensión 4**, puedes generar problemas aleatorios adicionales.

4. Elige un archivo de problema PDDL desde el directorio adecuado.

5. El script ejecutará FF o MFF según la opción seleccionada y mostrará la planificación por día.

## **Salida**

El script lee y filtra la salida de FF, organizando las acciones por día y mostrando el plan final en la consola.

---
