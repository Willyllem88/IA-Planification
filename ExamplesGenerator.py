import random
import os


def add_to_plan(is_wanted, predecessors, parallels):
    n = len(is_wanted)
    all = is_wanted.copy()
    temp = is_wanted.copy()
   
    while  len(temp) > 0:
        c = temp[-1]
        temp.pop()
        for pair in predecessors:
            if pair[1] == c:
                if pair[0] not in all:
                    temp.append(pair[0])
                    all.append(pair[0])
                    n += 1
        for pair in parallels:
            if pair[1] == c:
                if pair[0] not in all:
                    temp.append(pair[0])
                    all.append(pair[0])
                    n += 1
    return n
    

def generate_random_problem(filename="random_problem.pddl"):
    # Parameters for randomization
    num_contents = random.randint(10, 20)  # Number of content items
    num_days = random.randint(7, 15)       # Number of days
    
    contents = [f"c{i}" for i in range(1, num_contents + 1)]
    days = [f"day{i}" for i in range(1, num_days + 1)]

    predecessors = []
    parallels = []
    is_wanted = []
    watched = [f"w{i}" for i in range(1, num_contents//4)]

    total_contents = contents + watched

    
    # Generate random relationships and goals
    is_wanted = random.sample(contents, random.randint(3, num_contents-4))
    
    unique_predecessors = set()
    for i in range(len(contents) - 1):
        if random.choice([True, False]):
            predecessors.append((contents[i], contents[i + 1]))
            unique_predecessors.add(contents[i + 1])
            unique_predecessors.add(contents[i])
    
    for _ in range(random.randint(5, 10)):
        c1, c2 = random.sample(contents, 2)
        if (c1, c2) not in predecessors and (c2, c1) not in predecessors and (c2, c1) not in parallels and (c1, c2) not in parallels and c1 not in unique_predecessors:
            parallels.append((c1, c2))
    
    to_plan = add_to_plan(is_wanted, predecessors, parallels)

    for i in range(len(watched)):
        c = random.choice(contents)
        if random.choice([True, False]):
            if random.choice([True, False]):
                predecessors.append((watched[i], c))
            else:
                parallels.append((watched[i], c))

    durations = {c: random.randint(40, 120) for c in total_contents}

    # Write to PDDL file
    with open(filename, "w") as f:
        f.write("(define (problem random-redflix-problem)\n")
        f.write("    (:domain redflix)\n\n")

        # Objects
        f.write("    (:objects\n")
        f.write("        " + " ".join(total_contents) + " - content\n")
        f.write("        " + " ".join(days) + " - day\n")
        f.write("    )\n\n")

        # Initial State
        f.write("    (:init\n")

        # Relationships
        for p in predecessors:
            f.write(f"        (predecessor {p[0]} {p[1]})\n")
        f.write("\n")

        for p in parallels:
            f.write(f"        (parallel {p[0]} {p[1]})\n")
        f.write("\n")

        # Wanted contents
        for c in is_wanted:
            f.write(f"        (is_wanted {c})\n")
        f.write("\n")

        # Watched contents
        for c in watched:
            f.write(f"        (watched {c})\n")
        f.write("\n")

        # Durations
        for c, d in durations.items():
            f.write(f"        (= (duration {c}) {d})\n")
        f.write("\n")

        # Days relationships
        for i in range(len(days) - 1):
            f.write(f"        (yesterday {days[i]} {days[i + 1]})\n")
        f.write("\n")

        # Initialize day durations
        for day in days:
            f.write(f"        (= (day_duration {day}) 0)\n")
        f.write("\n")

        # Initialize day priorities
        for i in range(len(days)):
            f.write(f"        (= (priority {days[i]}) {i+1})\n")
        f.write("\n")
       

        # Initialize total metrics
        f.write("        (= (total-days) 0)\n")
        f.write(f"        (= (remaining-content) {to_plan})\n")

        f.write("    )\n\n")

        # Goal
        f.write("    (:goal\n")
        f.write("        (and\n")
        f.write("            (= (remaining-content) 0)\n")
        f.write("        )\n")
        f.write("    )\n\n")

        # Metric
        f.write("    (:metric minimize (total-days))\n")
        f.write(")\n")

if __name__ == "__main__":
    output_dir = "random_problems"
    os.makedirs(output_dir, exist_ok=True)

    for i in range(5):  # Generate 5 random problems
        filename = os.path.join(output_dir, f"problem_{i + 1}.pddl")
        generate_random_problem(filename)

    print(f"Generated 5 random PDDL problems in the directory: {output_dir}")
