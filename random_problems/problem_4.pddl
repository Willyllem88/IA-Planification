(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 w1 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    )

    (:init
        (predecessor c1 c2)
        (predecessor c2 c3)
        (predecessor c3 c4)
        (predecessor c4 c5)
        (predecessor c5 c6)
        (predecessor c7 c8)
        (predecessor c10 c11)
        (predecessor w1 c7)

        (parallel c3 c7)
        (parallel c1 c8)
        (parallel c7 c1)
        (parallel c11 c8)
        (parallel c8 c5)
        (parallel c5 c9)

        (is_wanted c10)
        (is_wanted c2)
        (is_wanted c11)
        (is_wanted c3)

        (watched w1)

        (= (duration c1) 88)
        (= (duration c2) 106)
        (= (duration c3) 89)
        (= (duration c4) 82)
        (= (duration c5) 63)
        (= (duration c6) 92)
        (= (duration c7) 74)
        (= (duration c8) 65)
        (= (duration c9) 94)
        (= (duration c10) 80)
        (= (duration c11) 64)
        (= (duration w1) 82)

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
        (= (remaining-content) 6)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
