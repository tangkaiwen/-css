   M S B A M L   `   `   `  ����  WPFDEMO    WPFDEMO.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$!  IOS推送消息测试工具��5   	   $	��350��6   $	��525��6*   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   6,   �� 5      $��* �6   6)   �� 5	      $
��auto �6   6,   .+�5   
   � $��0��6   $��2q�6    � ColumnDefinitions 5      �� 5      $��* �6#   6/   �� 5      $
��auto �6#   62   �� 5      $
��auto �6#   62   .+�5      �� -   5         ��Name$ 
txt_stoken��5      $��2q�6+   68   �� 5      -   5         ��Name$ btn_Send��5   |   $��发送��6   $
��Left=�6"   $��2��6=   $��2q�6N   $	��Top=�6Y   $��75��6q   6�   �� 5      -   5        $ 	btn_Reset��5   N   $��重置��6   $
��Left=�6"   $��1��6=   $��2q�6a   $	��Top=�6l   $��75��6�   6�   5      �� 5   
   -   5        $ 
txt_action��5   K    �� TextWrapping$
 Wrap=�6   $��2q�6'   
������� �� AcceptsReturn . " �� VerticalScrollBarVisibility$
 Auto=�6t   $��1��6�   �� 5   
   -   5        $ txt_MSG��5      $��2��6#   $��2q�60   
�������
���  ��$
 Wrap=�6i    . $
 Auto=�6�    �� 
IsReadOnly . 6�   5      5      