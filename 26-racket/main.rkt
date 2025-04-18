#lang racket
(define-struct node (content left right) #:mutable)

(define (create-node content) (make-node content null null))

(define (get-traversal node) 
  (append
    (if (node? (node-left node))
        (get-traversal (node-left node))
        null)

    (list (node-content node))

    (if (node? (node-right node))
        (get-traversal (node-right node))
        null)
   )
)

(define (reverse-tree node)
  (let
    (
     [current-node-content (node-content node)]
     [reversed-left
       (if (node? (node-left node))
           (reverse-tree (node-left node))
           null)
       ]
     [reversed-right
       (if (node? (node-right node))
           (reverse-tree (node-right node))
           null)
       ]
     )

    (make-node current-node-content reversed-right reversed-left)
  )
)

(define node1 (create-node "4"))
(define node2 (create-node "2"))
(define node3 (create-node "5"))
(define node4 (create-node "1"))
(define node5 (create-node "3"))

(set-node-left! node1 node2)
(set-node-right! node1 node3)
(set-node-left! node2 node4)
(set-node-right! node2 node5)

(println (get-traversal node1))
(println (get-traversal (reverse-tree node1)))

