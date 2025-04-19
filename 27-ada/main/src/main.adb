with Ada.Strings.Unbounded; with Ada.Text_IO;
use Ada.Text_IO; use Ada.Strings.Unbounded;

procedure Main is
   type Node;

   type PNode is access all Node;

   type Node is record
      Content     : Unbounded_String;
      Left, Right : PNode := null;
   end record;

   procedure Get_Traversal (NodePtr : PNode) is
   begin
      if NodePtr = null then
         return;
      end if;

      Get_Traversal (NodePtr.Left);

      Put (To_String (NodePtr.Content));
      Put (", ");

      Get_Traversal (NodePtr.Right);
   end Get_Traversal;

   procedure Reverse_Tree (NodePtr : PNode) is
      NodeLeft, NodeRight : PNode;
   begin
      if NodePtr.Left /= null then
         Reverse_Tree (NodePtr.Left);
      end if;
      if NodePtr.Right /= null then
         Reverse_Tree (NodePtr.Right);
      end if;

      NodeLeft := NodePtr.Left;
      NodeRight := NodePtr.Right;

      NodePtr.Left := NodeRight;
      NodePtr.Right := NodeLeft;
   end Reverse_Tree;

   Node1, Node2, Node3, Node4, Node5 : aliased Node;
begin
   Node1.Content := To_Unbounded_String ("4");
   Node2.Content := To_Unbounded_String ("2");
   Node3.Content := To_Unbounded_String ("5");
   Node4.Content := To_Unbounded_String ("1");
   Node5.Content := To_Unbounded_String ("3");

   Node1.Left := Node2'Access;
   Node1.Right := Node3'Access;
   Node2.Left := Node4'Access;
   Node2.Right := Node5'Access;

   Get_Traversal (Node1'Access);

   New_Line;

   Reverse_Tree (Node1'Access);

   New_Line;

   Get_Traversal (Node1'Access);
end Main;
