0:     m1-order_po_lettuce_tomato_salad(client1) (id:0)                earliest-start: 0     min-duration: 161   [PENDING]   [tp165@0,tp166@161]     
0:     m2-m_prepare_tableware(plate4) (id:3,parent:0)                  earliest-start: 0     min-duration: 22    [PENDING]   [tp199@0,tp200@22]      
0:     m2-m_transport_to(plate4, counterMiddle2) (id:4,parent:3)       earliest-start: 0     min-duration: 22    [PENDING]   [tp205@0,tp206@22]      
0:     m2-m_fetch(cook1, plate4) (id:6,parent:4)                       earliest-start: 0     min-duration: 8     [PENDING]   [tp221@0,tp222@8]       
0:     m2-m_get_to(cook1, manPlateDispenser) (id:14,parent:6)          earliest-start: 0     min-duration: 2     [PENDING]   [tp299@0,tp300@2]       
0:     a_move(cook1, manPlateDispenser) (id:15,parent:14)              earliest-start: 0     min-duration: 2     [PENDING]   [tp303@0,tp304@2]       
0:     m2-m_chop(tomato1) (id:16,parent:0)                             earliest-start: 0     min-duration: 44    [PENDING]   [tp307@0,tp308@44]      
0:     m2-m_transport_to(tomato1, taKnife3) (id:18,parent:16)          earliest-start: 0     min-duration: 33    [PENDING]   [tp327@0,tp328@33]      
0:     m2-m_fetch(cook2, tomato1) (id:20,parent:18)                    earliest-start: 0     min-duration: 16    [PENDING]   [tp343@0,tp344@16]      
0:     m2-m_chop(lettuce1) (id:24,parent:0)                            earliest-start: 0     min-duration: 102   [PENDING]   [tp375@0,tp376@102]     
0:     m2-m_transport_to(lettuce1, taKnife4) (id:26,parent:24)         earliest-start: 0     min-duration: 91    [PENDING]   [tp395@0,tp396@91]      
0:     m2-m_fetch(cook1, lettuce1) (id:28,parent:26)                   earliest-start: 0     min-duration: 71    [PENDING]   [tp411@0,tp412@71]      
0:     m2-m_get_to(cook2, manTomatoDispenser) (id:34,parent:20)        earliest-start: 0     min-duration: 10    [PENDING]   [tp451@0,tp452@10]      
0:     a_move(cook2, manTomatoDispenser) (id:35,parent:34)             earliest-start: 0     min-duration: 10    [PENDING]   [tp455@0,tp456@10]      
0:     m2-m_get_to(cook1, manLettuceDispenser) (id:36,parent:28)       earliest-start: 0     min-duration: 65    [PENDING]   [tp459@0,tp460@65]      
2:     a_pick_up(cook1, plate4) (id:7,parent:6)                        earliest-start: 2     min-duration: 6     [PENDING]   [tp229@2,tp230@8]       
8:     m2-m_get_to(cook1, manCounterMiddle2Top) (id:38,parent:4)    earliest-start: 8     min-duration: 10    [PENDING]   [tp467@8,tp468@18]      
8:     a_move(cook1, manCounterMiddle2Top) (id:39,parent:38)        earliest-start: 8     min-duration: 10    [PENDING]   [tp471@8,tp472@18]      
10:    a_pick_up(cook2, tomato1) (id:21,parent:20)                     earliest-start: 10    min-duration: 6     [PENDING]   [tp351@10,tp352@16]     
16:    m2-m_get_to(cook2, manKnife3) (id:40,parent:18)                 earliest-start: 16    min-duration: 13    [PENDING]   [tp475@16,tp476@29]     
16:    a_move(cook2, manKnife3) (id:41,parent:40)                      earliest-start: 16    min-duration: 13    [PENDING]   [tp479@16,tp480@29]     
18:    a_drop(cook1, plate4) (id:5,parent:4)                           earliest-start: 18    min-duration: 4     [PENDING]   [tp213@18,tp214@22]     
29:    a_drop(cook2, tomato1) (id:19,parent:18)                        earliest-start: 29    min-duration: 4     [PENDING]   [tp335@29,tp336@33]     
33:    a_chop(cook2, tomato1, knife3) (id:17,parent:16)                earliest-start: 33    min-duration: 11    [PENDING]   [tp313@33,tp314@44]     
44:    m1-m_arrange(tomato1, plate4) (id:1,parent:0)                   earliest-start: 44    min-duration: 76    [PENDING]   [tp179@44,tp180@120]    
44:    m2-m_fetch(cook2, tomato1) (id:22,parent:1)                     earliest-start: 44    min-duration: 7     [PENDING]   [tp359@44,tp360@51]     
44:    m1-m_get_to(cook2, manKnife3) (id:44,parent:22)                 earliest-start: 44    min-duration: 1     [PENDING]   [tp491@44,tp492@45]     
45:    a_pick_up(cook2, tomato1) (id:23,parent:22)                     earliest-start: 45    min-duration: 6     [PENDING]   [tp367@45,tp368@51]     
51:    m2-m_get_to(cook2, manCounterMiddle2Top) (id:42,parent:1)    earliest-start: 51    min-duration: 1     [PENDING]   [tp483@51,tp484@52]     
51:    a_move(cook2, manCounterMiddle2Top) (id:43,parent:42)        earliest-start: 51    min-duration: 1     [PENDING]   [tp487@51,tp488@52]     
52:    a_move(cook1, manLettuceDispenser) (id:37,parent:36)            earliest-start: 52    min-duration: 13    [PENDING]   [tp463@52,tp464@65]     
65:    a_pick_up(cook1, lettuce1) (id:29,parent:28)                    earliest-start: 65    min-duration: 6     [PENDING]   [tp419@65,tp420@71]     
71:    m2-m_get_to(cook1, manKnife4) (id:45,parent:26)                 earliest-start: 71    min-duration: 16    [PENDING]   [tp495@71,tp496@87]     
71:    a_move(cook1, manKnife4) (id:46,parent:45)                      earliest-start: 71    min-duration: 16    [PENDING]   [tp499@71,tp500@87]     
87:    a_drop(cook1, lettuce1) (id:27,parent:26)                       earliest-start: 87    min-duration: 4     [PENDING]   [tp403@87,tp404@91]     
91:    a_chop(cook1, lettuce1, knife4) (id:25,parent:24)               earliest-start: 91    min-duration: 11    [PENDING]   [tp381@91,tp382@102]    
102:   m1-m_arrange(lettuce1, plate4) (id:2,parent:0)                  earliest-start: 102   min-duration: 30    [PENDING]   [tp189@102,tp190@132]   
102:   m2-m_fetch(cook1, lettuce1) (id:30,parent:2)                    earliest-start: 102   min-duration: 7     [PENDING]   [tp427@102,tp428@109]   
102:   m1-m_get_to(cook1, manKnife4) (id:49,parent:30)                 earliest-start: 102   min-duration: 1     [PENDING]   [tp511@102,tp512@103]   
103:   a_pick_up(cook1, lettuce1) (id:31,parent:30)                    earliest-start: 103   min-duration: 6     [PENDING]   [tp435@103,tp436@109]   
109:   m2-m_get_to(cook1, manCounterMiddle2Bottom) (id:47,parent:2)       earliest-start: 109   min-duration: 13    [PENDING]   [tp503@109,tp504@122]   
109:   a_move(cook1, manCounterMiddle2Bottom) (id:48,parent:47)           earliest-start: 109   min-duration: 13    [PENDING]   [tp507@109,tp508@122]   
110:   a_arrange(cook2, tomato1, plate4) (id:9,parent:1)               earliest-start: 110   min-duration: 10    [PENDING]   [tp249@110,tp250@120]   
122:   a_arrange(cook1, lettuce1, plate4) (id:8,parent:2)              earliest-start: 122   min-duration: 10    [PENDING]   [tp237@122,tp238@132]   
132:   m1-m_deliver(plate4, client1) (id:10,parent:0)                  earliest-start: 132   min-duration: 29    [PENDING]   [tp261@132,tp262@161]   
132:   m2-m_fetch(cook1, plate4) (id:12,parent:10)                     earliest-start: 132   min-duration: 16    [PENDING]   [tp283@132,tp284@148]   
132:   m2-m_get_to(cook1, manCounterMiddle2Top) (id:50,parent:12)   earliest-start: 132   min-duration: 10    [PENDING]   [tp515@132,tp516@142]   
132:   a_move(cook1, manCounterMiddle2Top) (id:51,parent:50)        earliest-start: 132   min-duration: 10    [PENDING]   [tp519@132,tp520@142]   
142:   a_pick_up(cook1, plate4) (id:13,parent:12)                      earliest-start: 142   min-duration: 6     [PENDING]   [tp291@142,tp292@148]   
148:   m2-m_get_to(cook1, manDeliver) (id:32,parent:10)                earliest-start: 148   min-duration: 8     [PENDING]   [tp443@148,tp444@156]   
148:   a_move(cook1, manDeliver) (id:33,parent:32)                     earliest-start: 148   min-duration: 8     [PENDING]   [tp447@148,tp448@156]   
156:   a_give(cook1, client1, plate4) (id:11,parent:10)                earliest-start: 156   min-duration: 5     [PENDING]   [tp271@156,tp272@161]   
