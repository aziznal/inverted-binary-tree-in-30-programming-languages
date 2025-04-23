(ns main.core)
(require '[clojure.string :as str])

(defn create-node [content left right]
  {:content content :left left :right right})

(defn get-traversal [node]
  (when node
    (concat (get-traversal (node :left))
            (vector (node :content))
            (get-traversal (node :right)))))

(defn reverse-tree [node]
  (when node
    (create-node (node :content) (reverse-tree (node :right)) (reverse-tree (node :left)))))

(def node3 (create-node "5" nil nil))
(def node4 (create-node "1" nil nil))
(def node5 (create-node "3" nil nil))
(def node2 (create-node "2" node4 node5))
(def node1 (create-node "4" node2 node3))

(defn -main
  "I can say 'Hello World'."
  []
  (println (get-traversal node1))
  (println (get-traversal (reverse-tree node1))))

