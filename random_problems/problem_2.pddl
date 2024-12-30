(define (problem random-redflix-problem)
    (:domain redflix)

    (:objects
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 w1 w2 w3 - content
        day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    )

    (:init
        (predecessor c5 c6)
        (predecessor c6 c7)
        (predecessor c7 c8)
        (predecessor c8 c9)
        (predecessor c9 c10)

        (parallel c13 c10)
        (parallel c3 c14)
        (parallel c12 c10)
        (parallel c7 c10)
        (parallel c12 c15)
        (parallel c7 c9)
        (parallel c2 c4)

        (is_wanted c8)
        (is_wanted c1)
        (is_wanted c2)

        (watched w1)
        (watched w2)
        (watched w3)

        (= (duration c1) 75)
        (= (duration c2) 89)
        (= (duration c3) 46)
        (= (duration c4) 102)
        (= (duration c5) 95)
        (= (duration c6) 50)
        (= (duration c7) 96)
        (= (duration c8) 51)
        (= (duration c9) 79)
        (= (duration c10) 99)
        (= (duration c11) 94)
        (= (duration c12) 79)
        (= (duration c13) 95)
        (= (duration c14) 120)
        (= (duration c15) 63)
        (= (duration c16) 45)
        (= (duration w1) 111)
        (= (duration w2) 109)
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
