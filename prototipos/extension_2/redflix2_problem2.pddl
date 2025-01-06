(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        bb_s1 bb_s2 bb_s3 bb_s4 bb_s5 aa1 aa2 aa3 cc1 cc2 - content
        day1 day2 - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos
        (watched bb_s1)
        (watched bb_s2)
        ;; Contenidos por ver
        (is_wanted cc2)

        ;; Relaciones entre contenidos
        ;;paralelos
        (parallel cc1 cc2)
        (parallel aa1 cc2)
        (parallel aa2 cc2)
        (parallel aa3 cc2)
        (parallel bb_s5 cc2)
        (parallel bb_s4 cc2)
        (parallel bb_s3 cc2)
        (parallel bb_s2 cc2)
        (parallel bb_s1 cc2)

        ;; Dias anteriores
        (yesterday day1 day2)

    )

    ;; Contenidos objetivo
    (:goal
        (and
            (assigned aa1)
            (assigned aa2)
            (assigned aa3)
            (assigned cc1)
            (assigned bb_s3)
            (assigned bb_s4)
            (assigned bb_s5)
        )
    )
)
