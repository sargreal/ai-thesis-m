0:    m1-order_po_lettuce_salad(client1) (id:0)                       earliest-start: 0    min-duration: 79   [PENDING]   [tp165@0,tp166@79]    
0:    m2-m_prepare_tableware(plate5) (id:2,parent:0)                  earliest-start: 0    min-duration: 40   [PENDING]   [tp185@0,tp186@40]    
0:    m2-m_transport_to(plate5, counterMiddle2) (id:3,parent:2)       earliest-start: 0    min-duration: 40   [PENDING]   [tp191@0,tp192@40]    
0:    m2-m_fetch(cook2, plate5) (id:5,parent:3)                       earliest-start: 0    min-duration: 26   [PENDING]   [tp207@0,tp208@26]    
0:    m2-m_get_to(cook2, manPlateDispenser) (id:12,parent:5)          earliest-start: 0    min-duration: 20   [PENDING]   [tp273@0,tp274@20]    
0:    m2-m_chop(lettuce5) (id:14,parent:0)                            earliest-start: 0    min-duration: 41   [PENDING]   [tp281@0,tp282@41]    
0:    m2-m_transport_to(lettuce5, taKnife3) (id:16,parent:14)         earliest-start: 0    min-duration: 30   [PENDING]   [tp301@0,tp302@30]    
0:    m2-m_fetch(cook1, lettuce5) (id:18,parent:16)                   earliest-start: 0    min-duration: 12   [PENDING]   [tp317@0,tp318@12]    
0:    m2-m_get_to(cook1, manLettuceDispenser) (id:24,parent:18)       earliest-start: 0    min-duration: 5    [PENDING]   [tp357@0,tp358@5]     
0:    a_move(cook1, manLettuceDispenser) (id:25,parent:24)            earliest-start: 0    min-duration: 5    [PENDING]   [tp361@0,tp362@5]     
6:    a_pick_up(cook1, lettuce5) (id:19,parent:18)                    earliest-start: 6    min-duration: 6    [PENDING]   [tp325@6,tp326@12]    
12:   a_move(cook2, manPlateDispenser) (id:13,parent:12)              earliest-start: 12   min-duration: 8    [PENDING]   [tp277@12,tp278@20]   
12:   m2-m_get_to(cook1, manKnife3) (id:28,parent:16)                 earliest-start: 12   min-duration: 14   [PENDING]   [tp373@12,tp374@26]   
12:   a_move(cook1, manKnife3) (id:29,parent:28)                      earliest-start: 12   min-duration: 14   [PENDING]   [tp377@12,tp378@26]   
20:   a_pick_up(cook2, plate5) (id:6,parent:5)                        earliest-start: 20   min-duration: 6    [PENDING]   [tp215@20,tp216@26]   
26:   a_drop(cook1, lettuce5) (id:17,parent:16)                       earliest-start: 26   min-duration: 4    [PENDING]   [tp309@26,tp310@30]   
26:   m2-m_get_to(cook2, manCounterMiddle2Top) (id:26,parent:3)    earliest-start: 26   min-duration: 10   [PENDING]   [tp365@26,tp366@36]   
26:   a_move(cook2, manCounterMiddle2Top) (id:27,parent:26)        earliest-start: 26   min-duration: 10   [PENDING]   [tp369@26,tp370@36]   
30:   a_chop(cook1, lettuce5, knife3) (id:15,parent:14)               earliest-start: 30   min-duration: 11   [PENDING]   [tp287@30,tp288@41]   
36:   a_drop(cook2, plate5) (id:4,parent:3)                           earliest-start: 36   min-duration: 4    [PENDING]   [tp199@36,tp200@40]   
41:   m1-m_arrange(lettuce5, plate5) (id:1,parent:0)                  earliest-start: 41   min-duration: 18   [PENDING]   [tp175@41,tp176@59]   
41:   m2-m_fetch(cook2, lettuce5) (id:20,parent:1)                    earliest-start: 41   min-duration: 7    [PENDING]   [tp333@41,tp334@48]   
41:   m2-m_get_to(cook2, manKnife3) (id:30,parent:20)                 earliest-start: 41   min-duration: 1    [PENDING]   [tp381@41,tp382@42]   
41:   a_move(cook2, manKnife3) (id:31,parent:30)                      earliest-start: 41   min-duration: 1    [PENDING]   [tp385@41,tp386@42]   
42:   a_pick_up(cook2, lettuce5) (id:21,parent:20)                    earliest-start: 42   min-duration: 6    [PENDING]   [tp341@42,tp342@48]   
48:   m2-m_get_to(cook2, manCounterMiddle2Top) (id:32,parent:1)    earliest-start: 48   min-duration: 1    [PENDING]   [tp389@48,tp390@49]   
48:   a_move(cook2, manCounterMiddle2Top) (id:33,parent:32)        earliest-start: 48   min-duration: 1    [PENDING]   [tp393@48,tp394@49]   
49:   a_arrange(cook2, lettuce5, plate5) (id:7,parent:1)              earliest-start: 49   min-duration: 10   [PENDING]   [tp223@49,tp224@59]   
59:   m1-m_deliver(plate5, client1) (id:8,parent:0)                   earliest-start: 59   min-duration: 20   [PENDING]   [tp235@59,tp236@79]   
59:   m2-m_fetch(cook1, plate5) (id:10,parent:8)                      earliest-start: 59   min-duration: 7    [PENDING]   [tp257@59,tp258@66]   
59:   m2-m_get_to(cook1, manCounterMiddle2Top) (id:34,parent:10)   earliest-start: 59   min-duration: 1    [PENDING]   [tp397@59,tp398@60]   
59:   a_move(cook1, manCounterMiddle2Top) (id:35,parent:34)        earliest-start: 59   min-duration: 1    [PENDING]   [tp401@59,tp402@60]   
60:   a_pick_up(cook1, plate5) (id:11,parent:10)                      earliest-start: 60   min-duration: 6    [PENDING]   [tp265@60,tp266@66]   
66:   m2-m_get_to(cook1, manDeliver) (id:22,parent:8)                 earliest-start: 66   min-duration: 8    [PENDING]   [tp349@66,tp350@74]   
66:   a_move(cook1, manDeliver) (id:23,parent:22)                     earliest-start: 66   min-duration: 8    [PENDING]   [tp353@66,tp354@74]   
74:   a_give(cook1, client1, plate5) (id:9,parent:8)                  earliest-start: 74   min-duration: 5    [PENDING]   [tp245@74,tp246@79] 