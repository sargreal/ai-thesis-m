0:     m1-order_lettuce_salad(client1) (id:0)                              earliest-start: 0     min-duration: 131   
0:     m1-m_chop(lettuce5) (id:1)                                          earliest-start: 0     min-duration: 62    
0:     m2-m_transport_to(lettuce5, counterTopRightTop) (id:3)              earliest-start: 0     min-duration: 37    
0:     m2-m_fetch(cook1, lettuce5) (id:8)                                  earliest-start: 0     min-duration: 13    
0:     m3-m_get_to(cook1, manLettuceDispenser) (id:10)                     earliest-start: 0     min-duration: 8     
0:     m2-m_get_to(cook1, floorLeftBottom) (id:12)                         earliest-start: 0     min-duration: 5     
0:     a_move(cook1, floorMidBottom, floorLeftBottom) (id:13)              earliest-start: 0     min-duration: 5     
6:     a_move(cook1, floorLeftBottom, manLettuceDispenser) (id:11)         earliest-start: 6     min-duration: 2     
8:     a_pick_up(cook1, lettuce5) (id:9)                                   earliest-start: 8     min-duration: 5     
13:    m3-m_get_to(cook1, manCounterTopRightTop) (id:14)                   earliest-start: 13    min-duration: 19    
13:    m3-m_get_to(cook1, floorRightTop) (id:16)                           earliest-start: 13    min-duration: 17    
13:    m3-m_get_to(cook1, floorMidTop) (id:18)                             earliest-start: 13    min-duration: 12    
13:    m3-m_get_to(cook1, floorMidBottom) (id:20)                          earliest-start: 13    min-duration: 7     
13:    m2-m_get_to(cook1, floorLeftBottom) (id:22)                         earliest-start: 13    min-duration: 2     
13:    a_move(cook1, manLettuceDispenser, floorLeftBottom) (id:23)         earliest-start: 13    min-duration: 2     
15:    a_move(cook1, floorLeftBottom, floorMidBottom) (id:21)              earliest-start: 15    min-duration: 5     
20:    a_move(cook1, floorMidBottom, floorMidTop) (id:19)                  earliest-start: 20    min-duration: 5     
25:    a_move(cook1, floorMidTop, floorRightTop) (id:17)                   earliest-start: 25    min-duration: 5     
30:    a_move(cook1, floorRightTop, manCounterTopRightTop) (id:15)         earliest-start: 30    min-duration: 2     
32:    a_drop(cook1, lettuce5) (id:4)                                      earliest-start: 32    min-duration: 5     
37:    a_chop(cook1, lettuce5, knife2) (id:2)                              earliest-start: 37    min-duration: 20    
57:    a_pick_up(cook1, lettuce5) (id:5)                                   earliest-start: 57    min-duration: 5     
62:    m1-m_arrange(lettuce5, plate5) (id:24)                              earliest-start: 62    min-duration: 46    
62:    m2-m_transport_to(plate5, counterTopRightBottom) (id:26)            earliest-start: 62    min-duration: 16    
62:    m2-m_fetch(cook2, plate5) (id:28)                                   earliest-start: 62    min-duration: 7     
62:    m2-m_get_to(cook2, manPlateDispenser) (id:30)                       earliest-start: 62    min-duration: 2     
62:    a_move(cook2, floorRightBottom, manPlateDispenser) (id:31)          earliest-start: 62    min-duration: 2     
64:    a_pick_up(cook2, plate5) (id:29)                                    earliest-start: 64    min-duration: 5     
69:    m3-m_get_to(cook2, manCounterTopRightBottom) (id:32)                earliest-start: 69    min-duration: 4     
69:    m2-m_get_to(cook2, floorRightBottom) (id:34)                        earliest-start: 69    min-duration: 2     
69:    a_move(cook2, manPlateDispenser, floorRightBottom) (id:35)          earliest-start: 69    min-duration: 2     
71:    a_move(cook2, floorRightBottom, manCounterTopRightBottom) (id:33)   earliest-start: 71    min-duration: 2     
73:    a_drop(cook2, plate5) (id:27)                                       earliest-start: 73    min-duration: 5     
78:    m1-m_fetch(cook1, lettuce5) (id:36)                                 earliest-start: 78    min-duration: 1     
79:    m3-m_get_to(cook1, manCounterTopRightBottom) (id:37)                earliest-start: 79    min-duration: 19    
79:    m3-m_get_to(cook1, floorRightBottom) (id:39)                        earliest-start: 79    min-duration: 17    
79:    m3-m_get_to(cook1, floorMidBottom) (id:41)                          earliest-start: 79    min-duration: 12    
79:    m3-m_get_to(cook1, floorMidTop) (id:43)                             earliest-start: 79    min-duration: 7     
79:    m2-m_get_to(cook1, floorRightTop) (id:45)                           earliest-start: 79    min-duration: 2     
79:    a_move(cook1, manCounterTopRightTop, floorRightTop) (id:46)         earliest-start: 79    min-duration: 2     
81:    a_move(cook1, floorRightTop, floorMidTop) (id:44)                   earliest-start: 81    min-duration: 5     
86:    a_move(cook1, floorMidTop, floorMidBottom) (id:42)                  earliest-start: 86    min-duration: 5     
91:    a_move(cook1, floorMidBottom, floorRightBottom) (id:40)             earliest-start: 91    min-duration: 5     
96:    a_move(cook1, floorRightBottom, manCounterTopRightBottom) (id:38)   earliest-start: 96    min-duration: 2     
98:    a_arrange_new(cook1, lettuce5, plate5) (id:25)                      earliest-start: 98    min-duration: 10    
108:   m1-m_deliver(plate5, client1) (id:6)                                earliest-start: 108   min-duration: 23    
108:   m2-m_fetch(cook2, plate5) (id:47)                                   earliest-start: 108   min-duration: 6     
108:   m1-m_get_to(cook2, manCounterTopRightBottom) (id:49)                earliest-start: 108   min-duration: 1     
109:   a_pick_up(cook2, plate5) (id:48)                                    earliest-start: 109   min-duration: 5     
114:   m3-m_get_to(cook2, floorExit) (id:50)                               earliest-start: 114   min-duration: 12    
114:   m3-m_get_to(cook2, floorMidBottom) (id:52)                          earliest-start: 114   min-duration: 7     
114:   m2-m_get_to(cook2, floorRightBottom) (id:54)                        earliest-start: 114   min-duration: 2     
114:   a_move(cook2, manCounterTopRightBottom, floorRightBottom) (id:55)   earliest-start: 114   min-duration: 2     
116:   a_move(cook2, floorRightBottom, floorMidBottom) (id:53)             earliest-start: 116   min-duration: 5     
121:   a_move(cook2, floorMidBottom, floorExit) (id:51)                    earliest-start: 121   min-duration: 5     
126:   a_give(cook2, client1, plate5) (id:7)                               earliest-start: 126   min-duration: 5     
