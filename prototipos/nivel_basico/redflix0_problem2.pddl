(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        a1 a2 a3 a4 a5 a6 a7 a8 b1 - content
        day1 day2 - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos
        (watched a1)
        (watched a2)
        ;; Contenidos por ver
        (is_wanted a3)
        (is_wanted a4)
        (is_wanted a5)
        (is_wanted a6)
        (is_wanted a7)
        (is_wanted a8)

        ;; Relaciones entre contenidos
        ;;predecesores
        (predecessor b1 a4)
        (predecessor a1 a3)

        ;; Dias anteriores
        (yesterday day1 day2)    
    )

    ;; Contenidos objetivo
    (:goal
        (and
            (assigned a3)
            (assigned a4)
            (assigned a5)
            (assigned a6)
            (assigned a7)   
            (assigned a8)
            (assigned b1)

        )
    )
)
