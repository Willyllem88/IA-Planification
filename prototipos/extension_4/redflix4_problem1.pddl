(define (problem redflix-problem)
    (:domain redflix)

    ;; Definición de objetos
    (:objects
        bb_s1 bb_s2 bb_s3 bb_s4 bb_s5 bb_s6 bb_s7 bb_s8 bb_s9 bb_s10 bb_s11 bb_s12 aa1 aa2 aa3 cc1 cc2 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    )

    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos

        ;; Contenidos por ver
        (is_wanted bb_s12)
        (is_wanted cc2)

        ;(day_to_watch bb_s5 day4)

        ;; Relaciones entre contenidos
        ;;predecesores
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
        (predecessor cc1 cc2)

        ;;paralelos
        (parallel aa1 bb_s12)
        (parallel aa2 bb_s12)
        (parallel aa3 bb_s12)

        ;; Dias anteriores
        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
        (yesterday day5 day6)
        (yesterday day6 day7)
        (yesterday day7 day8)
        (yesterday day8 day9)
        (yesterday day9 day10)
        (yesterday day10 day11)
        (yesterday day11 day12)

        ;;(duration bb_s1 50)
        (= (duration bb_s1) 50)
        (= (duration bb_s2) 70)
        (= (duration bb_s3) 80)
        (= (duration bb_s4) 50)
        (= (duration bb_s5) 70)
        (= (duration bb_s6) 80)
        (= (duration bb_s7) 50)
        (= (duration bb_s8) 70)
        (= (duration bb_s9) 80)
        (= (duration bb_s10) 50)
        (= (duration bb_s11) 70)
        (= (duration bb_s12) 90)
        (= (duration cc1) 60)
        (= (duration cc2) 100)
        (= (duration aa1) 50)
        (= (duration aa2) 70)
        (= (duration aa3) 80)

        (= (day_duration day1) 0)
        (= (day_duration day2) 0)
        (= (day_duration day3) 0)
        (= (day_duration day4) 0)
        (= (day_duration day5) 0)
        (= (day_duration day6) 0)
        (= (day_duration day7) 0)
        (= (day_duration day8) 0)
        (= (day_duration day9) 0)
        (= (day_duration day10) 0)
        (= (day_duration day11) 0)
        (= (day_duration day12) 0)
        

        (= (total-days) 0)

        (= (remaining-content) 17)  ; Total number of is_wanted content

    )

    ;; Contenidos objetivo
    (:goal
        (and
               (= (remaining-content) 0)    ; All content has been assigned
        )
    )

    (:metric minimize (total-days))

)
