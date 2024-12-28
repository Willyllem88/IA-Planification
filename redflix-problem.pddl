(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        bb_s1 bb_s2 bb_s3 bb_s4 bb_s5 aa1 aa2 aa3 cc1 cc2 - content
        day1 day2 day3 day4 day5 day6 day7 - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos

        ;; Contenidos por ver
        (is_wanted bb_s5)
        (is_wanted cc2)

        ;; Relaciones entre contenidos
        ;;predecesores
        (predecessor bb_s1 bb_s2)
        (predecessor bb_s2 bb_s3)
        (predecessor bb_s3 bb_s4)
        (predecessor bb_s4 bb_s5)
        (predecessor cc1 cc2)

        ;;paralelos
        (parallel aa1 bb_s5)
        (parallel aa2 bb_s5)
        (parallel aa3 bb_s5)

        ;; Dias anteriores
        (previous day1 day2)
        (previous day1 day3)
        (previous day1 day4)
        (previous day1 day5)

        (previous day2 day3)
        (previous day2 day4)
        (previous day2 day5)

        (previous day3 day4)
        (previous day3 day5)

        (previous day4 day5)

    )

    ;; Contenidos objetivo
    (:goal
        (and
            (day_to_watch bb_s1 day1)
            (assigned aa1)
            (assigned aa2)
            (assigned aa3)
            (assigned cc1)
        )
    )
)
