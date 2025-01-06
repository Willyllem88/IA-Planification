(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        bb_s0 bb_s1 bb_s2 bb_s3 bb_s4 bb_s5 bb_s6 bb_s7 aa1 aa2 cc1 cc2 cc3 - content
        day1 day2 day3  - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos
        (watched bb_s4)
        (watched aa1)

        ;; Contenidos por ver
        (is_wanted bb_s5)
        (is_wanted bb_s3)
        (is_wanted aa2)
        (is_wanted cc1)
        (is_wanted cc2)
        (is_wanted cc3)

        ;; Relaciones entre contenidos
        ;;predecesores
        (predecessor bb_s0 bb_s2)
        (predecessor bb_s1 bb_s2)
        (predecessor bb_s2 bb_s5)
        (predecessor bb_s3 bb_s5)
        (predecessor bb_s4 bb_s5)
        (predecessor bb_s5 bb_s6)

        ;;paralelos
        (parallel aa1 bb_s5)
        (parallel aa2 bb_s5)
        (parallel bb_s5  bb_s7)

        ;; Dias anteriores
        (yesterday day1 day2)
        (yesterday day2 day3)
        
    )

    ;; Contenidos objetivo
    (:goal
        (and
            (assigned bb_s1)
            (assigned bb_s0)
            (assigned bb_s3)
            (assigned aa2)
            (assigned cc1)
            (assigned cc2)
            (assigned cc3)
            
        )
    )
)
