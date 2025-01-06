(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        bb_s1 bb_s2 bb_s3 bb_s4 bb_s5 cc1 cc2 w1 - content
        day1 day2 day3 day4 day5 - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos
        (watched bb_s4)
        (watched bb_s3)
        (watched w1)
        ;; Contenidos por ver
        (is_wanted bb_s5)
        (is_wanted cc2)

        ;; Relaciones entre contenidos
        ;;predecesores
        (predecessor bb_s1 bb_s5)
        (predecessor bb_s2 bb_s5)
        (predecessor bb_s3 bb_s5)
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
            (assigned bb_s1)
            (assigned bb_s2)
            (assigned cc2)
        )
    )
)
