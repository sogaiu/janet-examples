(def replacer
  (peg/compile
    ~(accumulate
       (any
         (choice (replace (capture (set "%*/:<>?"))
                          ,|(string "_" (get $ 0)))
                 (capture 1))))))

(defn sym-to-filename
  ``
  Convert a symbol to a filename. Certain filenames are not allowed on
  various operating systems.
  ``
  [fname]
  (string "examples/"
          (get (peg/match replacer fname) 0) ".janet"))

(defn main
  [& args]
  (def symbol-name (get args 1))
  (assert symbol-name "please specify a symbol name")
  (print (string/slice (sym-to-filename symbol-name)
                       (length "examples/"))))
