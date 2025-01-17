(comment

  # a function that doubles its arguments
  ((fn [n] (+ n n)) 10)
  # =>
  20

  ((short-fn (+ $ $)) 10)
  # =>
  20

  # $0 is the first (zero-th) argument
  ((short-fn (+ $0 $0)) 10)
  # =>
  20

  # handling multiple arguments: $0, $1, ...
  ((short-fn (string $0 $1)) "hi" "ho")
  # =>
  "hiho"

  # variadic function
  ((short-fn (apply + $&)) 1 2 3)
  # =>
  6

  # use pipe reader macro for terse function literals
  (|(+ $ $) 10)
  # =>
  20

  # structs and some other things work too
  (|{:a 1})
  # =>
  {:a 1}

  # stacking of pipes...
  ((||8))
  # =>
  8

  )

