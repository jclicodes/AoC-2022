(require '[clojure.string :as s])

(defn parse-elf
  "Parse an individual elf such as '1024\n1266\n3104'"
  [elf]
  (->> (s/split elf #"\n")
    (map #(Integer/parseInt %))
    (reduce +))
)

(defn process
  "Process list of elves such as
    '1024\n1266\n3104\n\n3918\n1044\n2110'"  
  [raw-input]
  (->> (s/split raw-input #"\n\n")
       (map parse-elf)
       (sort)
   )
)

(def results (process (slurp "input.txt")))

(println "Part 1:" (last results))
(println "Part 2:" (reduce + (take-last 3 results)))
