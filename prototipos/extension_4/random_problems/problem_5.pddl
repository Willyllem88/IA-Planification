(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 w1 w2 w3 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    )

    (:init
        (predecessor c1 c2)
        (predecessor c2 c3)
        (predecessor c4 c5)
        (predecessor c5 c6)
        (predecessor c6 c7)
        (predecessor c10 c11)
        (predecessor c11 c12)
        (predecessor c12 c13)
        (predecessor c14 c15)

        (parallel c9 c14)
        (parallel w1 c12)
        (parallel w2 c14)

        (is_wanted c10)
        (is_wanted c5)
        (is_wanted c8)
        (is_wanted c9)
        (is_wanted c2)

        (watched w1)
        (watched w2)
        (watched w3)

        (= (duration c1) 101)
        (= (duration c2) 68)
        (= (duration c3) 63)
        (= (duration c4) 117)
        (= (duration c5) 111)
        (= (duration c6) 50)
        (= (duration c7) 86)
        (= (duration c8) 58)
        (= (duration c9) 45)
        (= (duration c10) 103)
        (= (duration c11) 45)
        (= (duration c12) 67)
        (= (duration c13) 97)
        (= (duration c14) 113)
        (= (duration c15) 87)
        (= (duration c16) 119)
        (= (duration w1) 116)
        (= (duration w2) 83)
        (= (duration w3) 104)

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
        (= (priority day11) 11)
        (= (priority day12) 12)

        (= (total-days) 0)
        (= (remaining-content) 7)
    )

    (:goal
        (and
            (= (remaining-content) 0)
        )
    )

    (:metric minimize (total-days))
)
