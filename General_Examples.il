;; "Author": Dr. Shayan (Sean) Taheri.
; "File Content": "General functions" written in the Cadence SKILL Language.
; In the Cadence SKILL Language, the semicolon is used to indicate a comment.
; Everything after the semicolon, on the same line, is treated as a comment and is ignored by the interpreter.
; The SKILL language script typically starts with function definitions and ends with function calls.
; Within a file, you can have any number of function definitions, variable declarations, and expressions.
; SKILL files typically have the ".il" extension, which stands for "interpreted language".
; If you were to save a SKILL script, it might be named something like "myscript.il".

; Print Hello World:
(defun hello-world ()
  (println "Hello, World!"))

; Print a Message:
(defun print-message ()
  (println "Hello from Cadence Skill!"))

; Sum of two numbers:
(defun sum (a b)
  (+ a b))

; Find Maximum of Two Numbers:
(defun max-of-two (a b)
  (if (> a b) a b))

; Get Minimum of Two Numbers:
(defun min-of-two (a b)
  (min a b))

; Check if Number is Even:
(defun is-even? (n)
  (= (mod n 2) 0))

; Get Absolute Value:
(defun absolute (n)
  (abs n))

; Factorial of a Number:
(defun factorial (n)
  (if (= n 0) 1 (* n (factorial (- n 1)))))

; Get List Length:
(defun list-length (lst)
  (length lst))

; Reverse a List:
(defun reverse-list (lst)
  (reverse lst))

; Check if Element Exists in List:
(defun exists? (elem lst)
  (member elem lst))

; Append to a List:
(defun append-to-list (elem lst)
  (append lst (list elem)))

; Sum of Elements in a List:
(defun sum-list (lst)
  (reduce '+ lst))

; Find Minimum in a List:
(defun min-in-list (lst)
  (reduce 'min lst))

; Convert Celsius to Fahrenheit:
(defun celsius-to-fahrenheit (c)
  (+ (* c 9/5) 32))

; Get First Element of List:
(defun first-element (lst)
  (car lst))

; Get First N Elements from a List:
(defun first-n-elements (lst n)
  (sublist lst 0 n))

; Get Rest of List:
(defun rest-of-list (lst)
  (cdr lst))

; Remove Duplicates from a List:
(defun remove-duplicates (lst)
  (remdup lst))

; List of Even Numbers from 1 to N:
(defun evens-till-n (n)
  (loop for i from 1 to n when (is-even? i) collect i))

; Concatenate Two Lists:
(defun concatenate-lists (lst1 lst2)
  (append lst1 lst2))

; Convert List of Numbers to Strings:
(defun numbers-to-strings (lst)
  (mapcar 'str lst))

; Convert Number to String:
(defun num-to-str (n)
  (sprintf nil "%d" n))

; Convert String to Number:
(defun str-to-num (s)
  (atoi s))

; Square of a Number:
(defun square (n)
  (* n n))

; Square All Elements in List:
(defun square-list (lst)
  (mapcar 'square lst))

; Filter Even Numbers from a List:
(defun filter-even (lst)
  (remove-if-not 'is-even? lst))

; Get Area of a Rectangle:
(defun rectangle-area (length width)
  (* length width))

; Get Perimeter of a Rectangle:
(defun rectangle-perimeter (length width)
  (* 2 (+ length width)))

; Check if Number is Prime:
(defun is-prime? (n)
  (loop for i from 2 to (sqrt n) 
        never (= (mod n i) 0)))

; Find All Prime Numbers Till N:
(defun primes-till-n (n)
  (loop for i from 2 to n when (is-prime? i) collect i))

; Convert String to Lowercase:
(defun to-lower (str)
  (downcase str))

; Convert String to Uppercase:
(defun to-upper (str)
  (upcase str))

; Get Difference of Two Numbers:
(defun difference (a b)
  (- a b))

; Multiply All Elements of a List:
(defun product-of-list (lst)
  (reduce '* lst))

; Multiply Two Numbers:
(defun multiply (a b)
  (* a b))

; Divide Two Numbers:
(defun divide (a b)
  (if (= b 0)
      "Division by zero!"
      (/ a b)))

; Get the Remainder:
(defun remainder (a b)
  (mod a b))

; Get the Average of Numbers in a List:
(defun average (lst)
  (/ (sum-list lst) (list-length lst)))

; Check if String Starts with a Prefix:
(defun starts-with? (str prefix)
  (eq (substring str 0 (length prefix)) prefix))
