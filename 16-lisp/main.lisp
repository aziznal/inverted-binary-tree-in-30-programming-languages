(defstruct node
  content
  left
  right
)

(defun create-node (content left right) 
  (make-node :content content :left left :right right)
)

(defun get-traversal (node)
  (append
    (if (node-left node)
        (get-traversal (node-left node)) 
        nil) 
    
    (list (node-content node)) 
    
    (if (node-right node) 
        (get-traversal (node-right node)) 
        nil) 
  )
)

(defun reverse-tree (node)
  (let 
    (
     (current-node-content (node-content node))
      (reversed-left 
        (if (node-left node) 
          (reverse-tree (node-left node)) 
          nil)
        )
      (reversed-right 
        (if (node-right node) 
          (reverse-tree (node-right node)) 
          nil)
        )
    ) ; end of let bindings 

    ; let body
    (create-node current-node-content reversed-right reversed-left)
   )
)

(defun print-traversal (traversal)
  (print traversal)
  (terpri)
)

(defvar node1 (create-node "4" nil nil))
(defvar node2 (create-node "2" nil nil))
(defvar node3 (create-node "5" nil nil))
(defvar node4 (create-node "1" nil nil))
(defvar node5 (create-node "3" nil nil))

(setf (node-left node1) node2)
(setf (node-right node1) node3)
(setf (node-left node2) node4)
(setf (node-right node2) node5)

(print-traversal (get-traversal node1))
(print-traversal (get-traversal (reverse-tree node1)))
