(define (problem redflix-problem)
    (:domain redflix)
    ;; Definición de objetos
    (:objects
        a1 a2 a3 a4 a5 a6 a7 b1 b2 b3 c1 c2 c3 c4 d1 d2 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    )
    ;; Estado inicial
    (:init
        ;; Contenidos ya vistos
        (watched a4)
        (watched d1)
        ;; Contenidos por ver
        (is_wanted b2)
        (is_wanted c2)
        

        ;; Relaciones entre contenidos
        ;;predecesores
        (predecessor a1 b1)
        (predecessor a2 b1)
        (predecessor a3 b1)
        (predecessor a4 b1)
        (predecessor a5 b1)
        (predecessor a6 b1)
        (predecessor a7 b1)
        (predecessor b1 b2)
        (predecessor b2 d2)
     
        ;;paralelos
        (parallel c1 b1)
        (parallel c2 b1)
        (parallel c3 b1)
        (parallel c4 b1)
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
       
        ;;(duration bb_s1 50)
        (= (duration a1) 20)
        (= (duration a2) 20)
        (= (duration a3) 20)
        (= (duration a4) 20)
        (= (duration a5) 20)
        (= (duration a6) 20)
        (= (duration a7) 20)
        (= (duration b1) 70)
        (= (duration b2) 80)
        (= (duration b3) 50)
        (= (duration c1) 30)
        (= (duration c2) 30)
        (= (duration c3) 30)
        (= (duration c4) 30)
        (= (duration d1) 60)
        (= (duration d2) 60)
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

        (= (priority day1) 1)
        (= (priority day2) 2)
        (= (priority day3) 3)
        (= (priority day4) 4)
        (= (priority day5) 5)
        (= (priority day6) 6)
        (= (priority day7) 7)
        (= (priority day8) 8)
        (= (priority day9) 9)
        (= (priority day10) 10)
        
        (= (total-days) 0)
        (= (remaining-content) 12)  ; Total number of is_wanted content
    )
    ;; Contenidos objetivo
    (:goal
        (and
               (= (remaining-content) 0)    ; All content has been assigned
        )
    )
    (:metric minimize (total-days))
)