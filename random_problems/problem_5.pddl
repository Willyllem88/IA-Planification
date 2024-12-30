(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 w1 w2 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    )

    (:init
        (predecessor c7 c8)
        (predecessor c8 c9)
        (predecessor c9 c10)
        (predecessor c10 c11)
        (predecessor c12 c13)
        (predecessor w1 c1)

        (parallel c11 c13)
        (parallel c5 c12)
        (parallel c3 c9)
        (parallel c2 c7)
        (parallel c8 c1)
        (parallel c13 c6)
        (parallel c8 c2)
        (parallel c8 c10)
        (parallel w2 c4)

        (is_wanted c5)
        (is_wanted c1)
        (is_wanted c7)
        (is_wanted c9)
        (is_wanted c6)
        (is_wanted c8)

        (watched w1)
        (watched w2)

        (= (duration c1) 93)
        (= (duration c2) 66)
        (= (duration c3) 66)
        (= (duration c4) 49)
        (= (duration c5) 117)
        (= (duration c6) 67)
        (= (duration c7) 44)
        (= (duration c8) 57)
        (= (duration c9) 48)
        (= (duration c10) 56)
        (= (duration c11) 59)
        (= (duration c12) 56)
        (= (duration c13) 97)
        (= (duration w1) 100)
        (= (duration w2) 82)

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

        (= (total-days) 0)
        (= (remaining-content) 12)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
