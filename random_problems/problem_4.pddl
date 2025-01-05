(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 w1 w2 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    )

    (:init
        (predecessor c2 c3)
        (predecessor c3 c4)
        (predecessor c4 c5)
        (predecessor c6 c7)
        (predecessor c9 c10)
        (predecessor c10 c11)
        (predecessor c13 c14)

        (parallel c1 c7)
        (parallel c12 c13)

        (is_wanted c12)
        (is_wanted c9)
        (is_wanted c3)
        (is_wanted c1)
        (is_wanted c10)

        (watched w1)
        (watched w2)

        (= (duration c1) 40)
        (= (duration c2) 105)
        (= (duration c3) 66)
        (= (duration c4) 77)
        (= (duration c5) 71)
        (= (duration c6) 120)
        (= (duration c7) 43)
        (= (duration c8) 118)
        (= (duration c9) 42)
        (= (duration c10) 70)
        (= (duration c11) 115)
        (= (duration c12) 76)
        (= (duration c13) 62)
        (= (duration c14) 63)
        (= (duration w1) 91)
        (= (duration w2) 83)

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
        (yesterday day12 day13)
        (yesterday day13 day14)
        (yesterday day14 day15)

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
        (= (day_duration day13) 0)
        (= (day_duration day14) 0)
        (= (day_duration day15) 0)

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
