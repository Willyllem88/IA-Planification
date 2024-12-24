(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        bb_s1 bb_s2 bb_s3 bb_s4 bb_s5 bb_s6 bb_s7 bb_s8 bb_s9 bb_s10 bb_s11 bb_s12 - content
        day1 day2 day3 day4 day5 - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos

        ;; Contenidos por ver
        (is_wanted bb_s12)

        ;(day_to_watch bb_s5 day4)

        ;; Relaciones entre contenidos
        (predecessor bb_s1 bb_s2)
        (predecessor bb_s2 bb_s3)
        (predecessor bb_s3 bb_s4)
        (predecessor bb_s4 bb_s5)
        (predecessor bb_s5 bb_s6)
        (predecessor bb_s6 bb_s7)
        (predecessor bb_s7 bb_s8)
        (predecessor bb_s8 bb_s9)
        (predecessor bb_s9 bb_s10)
        (predecessor bb_s10 bb_s11)
        (predecessor bb_s11 bb_s12)

        ;; Dias anteriores
        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
    )

    ;; Contenidos objetivo
    (:goal
        (and
            (day_to_watch bb_s1 day1)
        )
    )
)
