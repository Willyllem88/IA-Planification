(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        bb_s1 bb_s2 bb_s3 bb_s4 bb_s5 - content ;;Breaking Bad
        day1 day2 day3 day4 day5 day6 - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos
        (watched bb_s1)

        ;; Contenidos por ver
        (is_wanted bb_s5)

        ;(day_to_watch bb_s5 day4)

        ;; Relaciones entre contenidos
        (predecessor bb_s1 bb_s2)
        (predecessor bb_s2 bb_s3)
        (predecessor bb_s3 bb_s4)
        (predecessor bb_s4 bb_s5)

        ;; Dias anteriores
        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
    )

    ;; Contenidos objetivo
    (:goal
        (and
            (day_to_watch bb_s2 day1)
        )
    )
)
