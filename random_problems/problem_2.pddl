(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 w1 w2 w3 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    )

    (:init
        (predecessor c1 c2)
        (predecessor c2 c3)
        (predecessor c3 c4)
        (predecessor c5 c6)
        (predecessor c6 c7)
        (predecessor c11 c12)
        (predecessor c12 c13)
        (predecessor w1 c4)

        (parallel c9 c14)
        (parallel c8 c10)
        (parallel c16 c10)
        (parallel c15 c9)

        (is_wanted c8)
        (is_wanted c6)
        (is_wanted c1)
        (is_wanted c9)
        (is_wanted c3)
        (is_wanted c13)

        (watched w1)
        (watched w2)
        (watched w3)

        (= (duration c1) 77)
        (= (duration c2) 97)
        (= (duration c3) 106)
        (= (duration c4) 72)
        (= (duration c5) 72)
        (= (duration c6) 96)
        (= (duration c7) 59)
        (= (duration c8) 88)
        (= (duration c9) 82)
        (= (duration c10) 73)
        (= (duration c11) 68)
        (= (duration c12) 43)
        (= (duration c13) 71)
        (= (duration c14) 85)
        (= (duration c15) 44)
        (= (duration c16) 102)
        (= (duration w1) 73)
        (= (duration w2) 116)
        (= (duration w3) 110)

        (yesterday day1 day2)
        (yesterday day2 day3)
        (yesterday day3 day4)
        (yesterday day4 day5)
        (yesterday day5 day6)
        (yesterday day6 day7)
        (yesterday day7 day8)
        (yesterday day8 day9)
        (yesterday day9 day10)

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

        (= (total-days) 0)
        (= (remaining-content) 11)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
