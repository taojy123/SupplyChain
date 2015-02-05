\* logistics network design *\
Minimize
object_function: Arc_resource_fixed_cost + Cycle_inventory_cost
 + Safety_inventory_cost + Variable_cost + _Arc_fixed_cost
Subject To
Arc_resource_fixed_cost: Arc_resource_fixed_cost
 - 40 z(customer,plantout,ship) - 20 z(customer,plantout,vehicle)
 - 50 z(plantin,plantout,line1) - 100 z(plantin,plantout,line2)
 - 50 z(plantin,sink,ship) - 40 z(plantout,customer,ship)
 - 20 z(plantout,customer,vehicle) - 80 z(plantout,plantin,line3)
 - 10 z(source1,plantin,vehicle) - 30 z(source2,plantin,ship) = 0
Capacity(customer,plantout,ship): x,customer,plantout,ship,retbottle
 - 100 z(customer,plantout,ship) <= 0
Capacity(customer,plantout,vehicle): x,customer,plantout,vehicle,retbottle
 - 100 z(customer,plantout,vehicle) <= 0
Capacity(plantin,plantout,line1): x,plantin,plantout,line1,juice1
 + x,plantin,plantout,line1,juice2 - 100 z(plantin,plantout,line1) <= 0
Capacity(plantin,plantout,line2): x,plantin,plantout,line2,juice1
 + x,plantin,plantout,line2,juice2 - 100 z(plantin,plantout,line2) <= 0
Capacity(plantin,sink,ship): x,plantin,sink,ship,glass
 - 100 z(plantin,sink,ship) <= 0
Capacity(plantout,customer,ship): x,plantout,customer,ship,juice1
 + x,plantout,customer,ship,juice2 - 100 z(plantout,customer,ship) <= 0
Capacity(plantout,customer,vehicle): x,plantout,customer,vehicle,juice1
 + x,plantout,customer,vehicle,juice2 - 100 z(plantout,customer,vehicle) <= 0
Capacity(plantout,plantin,line3): x,plantout,plantin,line3,retbottle
 - 100 z(plantout,plantin,line3) <= 0
Capacity(source1,plantin,vehicle): x,source1,plantin,vehicle,apple
 + x,source1,plantin,vehicle,melon - 100 z(source1,plantin,vehicle) <= 0
Capacity(source2,plantin,ship): x,source2,plantin,ship,bottle
 - 100 z(source2,plantin,ship) <= 0
Connect(customer,plantout,ship): - y(customer,plantout)
 + z(customer,plantout,ship) <= 0
Connect(customer,plantout,vehicle): - y(customer,plantout)
 + z(customer,plantout,vehicle) <= 0
Connect(plantin,plantout,line1): - y(plantin,plantout)
 + z(plantin,plantout,line1) <= 0
Connect(plantin,plantout,line2): - y(plantin,plantout)
 + z(plantin,plantout,line2) <= 0
Connect(plantin,sink,ship): - y(plantin,sink) + z(plantin,sink,ship) <= 0
Connect(plantout,customer,ship): - y(plantout,customer)
 + z(plantout,customer,ship) <= 0
Connect(plantout,customer,vehicle): - y(plantout,customer)
 + z(plantout,customer,vehicle) <= 0
Connect(plantout,plantin,line3): - y(plantout,plantin)
 + z(plantout,plantin,line3) <= 0
Connect(source1,plantin,vehicle): - y(source1,plantin)
 + z(source1,plantin,vehicle) <= 0
Connect(source2,plantin,ship): - y(source2,plantin) + z(source2,plantin,ship)
 <= 0
Corbon_Foot_Print_Upper_Bound: 6.927 x,customer,plantout,ship,retbottle
 + 3.252 x,plantin,sink,ship,glass + 11.545 x,plantout,customer,ship,juice1
 + 12.6995 x,plantout,customer,ship,juice2
 + 1.14 x,source2,plantin,ship,bottle + 461.8 z(customer,plantout,ship)
 + 650.4 z(plantin,sink,ship) + 461.8 z(plantout,customer,ship)
 + 76 z(source2,plantin,ship) <= 10000
Cycle_inventory_cost: Cycle_inventory_cost
 - 0.2 x,customer,plantout,ship,retbottle
 - 0.1 x,customer,plantout,vehicle,retbottle
 - 12.125 x,plantin,plantout,line1,juice1
 - 11.5 x,plantin,plantout,line1,juice2
 - 7.275 x,plantin,plantout,line2,juice1 - 6.9 x,plantin,plantout,line2,juice2
 - 0.4 x,plantin,sink,ship,glass - x,plantout,customer,ship,juice1
 - x,plantout,customer,ship,juice2 - 2.5 x,plantout,customer,vehicle,juice1
 - 2.5 x,plantout,customer,vehicle,juice2
 - 0.125 x,plantout,plantin,line3,retbottle
 - 0.125 x,source1,plantin,vehicle,apple
 - 0.25 x,source1,plantin,vehicle,melon - 0.225 x,source2,plantin,ship,bottle
 = 0
Flow(customer,juice1): x,plantout,customer,ship,juice1
 + x,plantout,customer,vehicle,juice1 = 10
Flow(customer,juice2): x,plantout,customer,ship,juice2
 + x,plantout,customer,vehicle,juice2 = 10
Flow(customer,retbottle): - x,customer,plantout,ship,retbottle
 - x,customer,plantout,vehicle,retbottle >= -10
Flow(plantin,apple): - 2 x,plantin,plantout,line1,juice1
 - 2 x,plantin,plantout,line1,juice2 - 2 x,plantin,plantout,line2,juice1
 - 2 x,plantin,plantout,line2,juice2 + x,source1,plantin,vehicle,apple = 0
Flow(plantin,bottle): - x,plantin,plantout,line1,juice1
 - x,plantin,plantout,line1,juice2 - x,plantin,plantout,line2,juice1
 - x,plantin,plantout,line2,juice2 + x,source2,plantin,ship,bottle = 0
Flow(plantin,glass): - x,plantin,sink,ship,glass
 + 0.5 x,plantout,plantin,line3,retbottle = 0
Flow(plantin,melon): - x,plantin,plantout,line1,juice1
 - 2 x,plantin,plantout,line1,juice2 - x,plantin,plantout,line2,juice1
 - 2 x,plantin,plantout,line2,juice2 + x,source1,plantin,vehicle,melon = 0
Flow(plantout,juice1): x,plantin,plantout,line1,juice1
 + x,plantin,plantout,line2,juice1 - x,plantout,customer,ship,juice1
 - x,plantout,customer,vehicle,juice1 = 0
Flow(plantout,juice2): x,plantin,plantout,line1,juice2
 + x,plantin,plantout,line2,juice2 - x,plantout,customer,ship,juice2
 - x,plantout,customer,vehicle,juice2 = 0
Flow(plantout,retbottle): x,customer,plantout,ship,retbottle
 + x,customer,plantout,vehicle,retbottle - x,plantout,plantin,line3,retbottle
 = 0
Flow(sink,glass): x,plantin,sink,ship,glass = 5
Flow(source1,apple): - x,source1,plantin,vehicle,apple >= -100
Flow(source1,melon): - x,source1,plantin,vehicle,melon >= -50
Flow(source2,bottle): - x,source2,plantin,ship,bottle >= -100
Safety_inventory_cost: Safety_inventory_cost
 - f,customer,plantout,ship,retbottle - f,customer,plantout,vehicle,retbottle
 - f,plantin,plantout,line1,juice1 - f,plantin,plantout,line1,juice2
 - f,plantin,plantout,line2,juice1 - f,plantin,plantout,line2,juice2
 - f,plantin,sink,ship,glass - f,plantout,customer,ship,juice1
 - f,plantout,customer,ship,juice2 - f,plantout,customer,vehicle,juice1
 - f,plantout,customer,vehicle,juice2 - f,plantout,plantin,line3,retbottle
 - f,source1,plantin,vehicle,apple - f,source1,plantin,vehicle,melon
 - f,source2,plantin,ship,bottle = 0
Variable_cost: Variable_cost - 2 x,customer,plantout,ship,retbottle
 - 2 x,customer,plantout,vehicle,retbottle
 - 10 x,plantin,plantout,line1,juice1 - 10 x,plantin,plantout,line1,juice2
 - 5 x,plantin,plantout,line2,juice1 - 5 x,plantin,plantout,line2,juice2
 - x,plantin,sink,ship,glass - 2 x,plantout,customer,ship,juice1
 - 2 x,plantout,customer,ship,juice2 - 10 x,plantout,customer,vehicle,juice1
 - 10 x,plantout,customer,vehicle,juice2
 - 5 x,plantout,plantin,line3,retbottle - x,source1,plantin,vehicle,apple
 - 2 x,source1,plantin,vehicle,melon - 3 x,source2,plantin,ship,bottle = 0
_Arc_fixed_cost: _Arc_fixed_cost - 100 y(customer,plantout)
 - 100 y(plantin,plantout) - 100 y(plantin,sink) - 100 y(plantout,customer)
 - 100 y(plantout,plantin) - 100 y(source1,plantin) - 100 y(source2,plantin)
 = 0
_C1: x,plantout,customer,vehicle,juice1
 - yL_1,plantout,customer,vehicle,juice1_
 - 2 yL_2,plantout,customer,vehicle,juice1_
 - 3 yL_3,plantout,customer,vehicle,juice1_
 - 4 yL_4,plantout,customer,vehicle,juice1_
 - 5 yL_5,plantout,customer,vehicle,juice1_
 - 6 yL_6,plantout,customer,vehicle,juice1_
 - 7 yL_7,plantout,customer,vehicle,juice1_
 - 8 yL_8,plantout,customer,vehicle,juice1_
 - 9 yL_9,plantout,customer,vehicle,juice1_
 - yR_0,plantout,customer,vehicle,juice1_
 - 2 yR_1,plantout,customer,vehicle,juice1_
 - 3 yR_2,plantout,customer,vehicle,juice1_
 - 4 yR_3,plantout,customer,vehicle,juice1_
 - 5 yR_4,plantout,customer,vehicle,juice1_
 - 6 yR_5,plantout,customer,vehicle,juice1_
 - 7 yR_6,plantout,customer,vehicle,juice1_
 - 8 yR_7,plantout,customer,vehicle,juice1_
 - 9 yR_8,plantout,customer,vehicle,juice1_
 - 10 yR_9,plantout,customer,vehicle,juice1_ = 0
_C10: yL_7,plantout,customer,vehicle,juice1_
 + yR_7,plantout,customer,vehicle,juice1_
 - z_7,plantout,customer,vehicle,juice1_ = 0
_C100: yL_6,plantin,plantout,line1,juice1_
 + yR_6,plantin,plantout,line1,juice1_ - z_6,plantin,plantout,line1,juice1_
 = 0
_C101: yL_7,plantin,plantout,line1,juice1_
 + yR_7,plantin,plantout,line1,juice1_ - z_7,plantin,plantout,line1,juice1_
 = 0
_C102: yL_8,plantin,plantout,line1,juice1_
 + yR_8,plantin,plantout,line1,juice1_ - z_8,plantin,plantout,line1,juice1_
 = 0
_C103: yL_9,plantin,plantout,line1,juice1_
 + yR_9,plantin,plantout,line1,juice1_ - z_9,plantin,plantout,line1,juice1_
 = 0
_C104: z_0,plantin,plantout,line1,juice1_ + z_1,plantin,plantout,line1,juice1_
 + z_2,plantin,plantout,line1,juice1_ + z_3,plantin,plantout,line1,juice1_
 + z_4,plantin,plantout,line1,juice1_ + z_5,plantin,plantout,line1,juice1_
 + z_6,plantin,plantout,line1,juice1_ + z_7,plantin,plantout,line1,juice1_
 + z_8,plantin,plantout,line1,juice1_ + z_9,plantin,plantout,line1,juice1_ = 1
_C105: x,customer,plantout,ship,retbottle
 - yL_1,customer,plantout,ship,retbottle_
 - 2 yL_2,customer,plantout,ship,retbottle_
 - 3 yL_3,customer,plantout,ship,retbottle_
 - 4 yL_4,customer,plantout,ship,retbottle_
 - 5 yL_5,customer,plantout,ship,retbottle_
 - 6 yL_6,customer,plantout,ship,retbottle_
 - 7 yL_7,customer,plantout,ship,retbottle_
 - 8 yL_8,customer,plantout,ship,retbottle_
 - 9 yL_9,customer,plantout,ship,retbottle_
 - yR_0,customer,plantout,ship,retbottle_
 - 2 yR_1,customer,plantout,ship,retbottle_
 - 3 yR_2,customer,plantout,ship,retbottle_
 - 4 yR_3,customer,plantout,ship,retbottle_
 - 5 yR_4,customer,plantout,ship,retbottle_
 - 6 yR_5,customer,plantout,ship,retbottle_
 - 7 yR_6,customer,plantout,ship,retbottle_
 - 8 yR_7,customer,plantout,ship,retbottle_
 - 9 yR_8,customer,plantout,ship,retbottle_
 - 10 yR_9,customer,plantout,ship,retbottle_ = 0
_C106: f,customer,plantout,ship,retbottle
 - 1.38048904378 yL_1,customer,plantout,ship,retbottle_
 - 1.95230632842 yL_2,customer,plantout,ship,retbottle_
 - 2.39107716312 yL_3,customer,plantout,ship,retbottle_
 - 2.76097808756 yL_4,customer,plantout,ship,retbottle_
 - 3.08686734409 yL_5,customer,plantout,ship,retbottle_
 - 3.38149375277 yL_6,customer,plantout,ship,retbottle_
 - 3.65243069749 yL_7,customer,plantout,ship,retbottle_
 - 3.90461265685 yL_8,customer,plantout,ship,retbottle_
 - 4.14146713134 yL_9,customer,plantout,ship,retbottle_
 - 1.38048904378 yR_0,customer,plantout,ship,retbottle_
 - 1.95230632842 yR_1,customer,plantout,ship,retbottle_
 - 2.39107716312 yR_2,customer,plantout,ship,retbottle_
 - 2.76097808756 yR_3,customer,plantout,ship,retbottle_
 - 3.08686734409 yR_4,customer,plantout,ship,retbottle_
 - 3.38149375277 yR_5,customer,plantout,ship,retbottle_
 - 3.65243069749 yR_6,customer,plantout,ship,retbottle_
 - 3.90461265685 yR_7,customer,plantout,ship,retbottle_
 - 4.14146713134 yR_8,customer,plantout,ship,retbottle_
 - 4.36548966326 yR_9,customer,plantout,ship,retbottle_ = 0
_C107: yL_0,customer,plantout,ship,retbottle_
 + yR_0,customer,plantout,ship,retbottle_
 - z_0,customer,plantout,ship,retbottle_ = 0
_C108: yL_1,customer,plantout,ship,retbottle_
 + yR_1,customer,plantout,ship,retbottle_
 - z_1,customer,plantout,ship,retbottle_ = 0
_C109: yL_2,customer,plantout,ship,retbottle_
 + yR_2,customer,plantout,ship,retbottle_
 - z_2,customer,plantout,ship,retbottle_ = 0
_C11: yL_8,plantout,customer,vehicle,juice1_
 + yR_8,plantout,customer,vehicle,juice1_
 - z_8,plantout,customer,vehicle,juice1_ = 0
_C110: yL_3,customer,plantout,ship,retbottle_
 + yR_3,customer,plantout,ship,retbottle_
 - z_3,customer,plantout,ship,retbottle_ = 0
_C111: yL_4,customer,plantout,ship,retbottle_
 + yR_4,customer,plantout,ship,retbottle_
 - z_4,customer,plantout,ship,retbottle_ = 0
_C112: yL_5,customer,plantout,ship,retbottle_
 + yR_5,customer,plantout,ship,retbottle_
 - z_5,customer,plantout,ship,retbottle_ = 0
_C113: yL_6,customer,plantout,ship,retbottle_
 + yR_6,customer,plantout,ship,retbottle_
 - z_6,customer,plantout,ship,retbottle_ = 0
_C114: yL_7,customer,plantout,ship,retbottle_
 + yR_7,customer,plantout,ship,retbottle_
 - z_7,customer,plantout,ship,retbottle_ = 0
_C115: yL_8,customer,plantout,ship,retbottle_
 + yR_8,customer,plantout,ship,retbottle_
 - z_8,customer,plantout,ship,retbottle_ = 0
_C116: yL_9,customer,plantout,ship,retbottle_
 + yR_9,customer,plantout,ship,retbottle_
 - z_9,customer,plantout,ship,retbottle_ = 0
_C117: z_0,customer,plantout,ship,retbottle_
 + z_1,customer,plantout,ship,retbottle_
 + z_2,customer,plantout,ship,retbottle_
 + z_3,customer,plantout,ship,retbottle_
 + z_4,customer,plantout,ship,retbottle_
 + z_5,customer,plantout,ship,retbottle_
 + z_6,customer,plantout,ship,retbottle_
 + z_7,customer,plantout,ship,retbottle_
 + z_8,customer,plantout,ship,retbottle_
 + z_9,customer,plantout,ship,retbottle_ = 1
_C118: x,source1,plantin,vehicle,apple - yL_1,source1,plantin,vehicle,apple_
 - 10 yL_10,source1,plantin,vehicle,apple_
 - 11 yL_11,source1,plantin,vehicle,apple_
 - 12 yL_12,source1,plantin,vehicle,apple_
 - 13 yL_13,source1,plantin,vehicle,apple_
 - 14 yL_14,source1,plantin,vehicle,apple_
 - 15 yL_15,source1,plantin,vehicle,apple_
 - 16 yL_16,source1,plantin,vehicle,apple_
 - 17 yL_17,source1,plantin,vehicle,apple_
 - 18 yL_18,source1,plantin,vehicle,apple_
 - 19 yL_19,source1,plantin,vehicle,apple_
 - 2 yL_2,source1,plantin,vehicle,apple_
 - 20 yL_20,source1,plantin,vehicle,apple_
 - 21 yL_21,source1,plantin,vehicle,apple_
 - 22 yL_22,source1,plantin,vehicle,apple_
 - 23 yL_23,source1,plantin,vehicle,apple_
 - 24 yL_24,source1,plantin,vehicle,apple_
 - 25 yL_25,source1,plantin,vehicle,apple_
 - 26 yL_26,source1,plantin,vehicle,apple_
 - 27 yL_27,source1,plantin,vehicle,apple_
 - 28 yL_28,source1,plantin,vehicle,apple_
 - 29 yL_29,source1,plantin,vehicle,apple_
 - 3 yL_3,source1,plantin,vehicle,apple_
 - 30 yL_30,source1,plantin,vehicle,apple_
 - 31 yL_31,source1,plantin,vehicle,apple_
 - 32 yL_32,source1,plantin,vehicle,apple_
 - 33 yL_33,source1,plantin,vehicle,apple_
 - 34 yL_34,source1,plantin,vehicle,apple_
 - 35 yL_35,source1,plantin,vehicle,apple_
 - 36 yL_36,source1,plantin,vehicle,apple_
 - 37 yL_37,source1,plantin,vehicle,apple_
 - 38 yL_38,source1,plantin,vehicle,apple_
 - 39 yL_39,source1,plantin,vehicle,apple_
 - 4 yL_4,source1,plantin,vehicle,apple_
 - 40 yL_40,source1,plantin,vehicle,apple_
 - 41 yL_41,source1,plantin,vehicle,apple_
 - 42 yL_42,source1,plantin,vehicle,apple_
 - 43 yL_43,source1,plantin,vehicle,apple_
 - 44 yL_44,source1,plantin,vehicle,apple_
 - 45 yL_45,source1,plantin,vehicle,apple_
 - 46 yL_46,source1,plantin,vehicle,apple_
 - 47 yL_47,source1,plantin,vehicle,apple_
 - 48 yL_48,source1,plantin,vehicle,apple_
 - 49 yL_49,source1,plantin,vehicle,apple_
 - 5 yL_5,source1,plantin,vehicle,apple_
 - 6 yL_6,source1,plantin,vehicle,apple_
 - 7 yL_7,source1,plantin,vehicle,apple_
 - 8 yL_8,source1,plantin,vehicle,apple_
 - 9 yL_9,source1,plantin,vehicle,apple_ - yR_0,source1,plantin,vehicle,apple_
 - 2 yR_1,source1,plantin,vehicle,apple_
 - 11 yR_10,source1,plantin,vehicle,apple_
 - 12 yR_11,source1,plantin,vehicle,apple_
 - 13 yR_12,source1,plantin,vehicle,apple_
 - 14 yR_13,source1,plantin,vehicle,apple_
 - 15 yR_14,source1,plantin,vehicle,apple_
 - 16 yR_15,source1,plantin,vehicle,apple_
 - 17 yR_16,source1,plantin,vehicle,apple_
 - 18 yR_17,source1,plantin,vehicle,apple_
 - 19 yR_18,source1,plantin,vehicle,apple_
 - 20 yR_19,source1,plantin,vehicle,apple_
 - 3 yR_2,source1,plantin,vehicle,apple_
 - 21 yR_20,source1,plantin,vehicle,apple_
 - 22 yR_21,source1,plantin,vehicle,apple_
 - 23 yR_22,source1,plantin,vehicle,apple_
 - 24 yR_23,source1,plantin,vehicle,apple_
 - 25 yR_24,source1,plantin,vehicle,apple_
 - 26 yR_25,source1,plantin,vehicle,apple_
 - 27 yR_26,source1,plantin,vehicle,apple_
 - 28 yR_27,source1,plantin,vehicle,apple_
 - 29 yR_28,source1,plantin,vehicle,apple_
 - 30 yR_29,source1,plantin,vehicle,apple_
 - 4 yR_3,source1,plantin,vehicle,apple_
 - 31 yR_30,source1,plantin,vehicle,apple_
 - 32 yR_31,source1,plantin,vehicle,apple_
 - 33 yR_32,source1,plantin,vehicle,apple_
 - 34 yR_33,source1,plantin,vehicle,apple_
 - 35 yR_34,source1,plantin,vehicle,apple_
 - 36 yR_35,source1,plantin,vehicle,apple_
 - 37 yR_36,source1,plantin,vehicle,apple_
 - 38 yR_37,source1,plantin,vehicle,apple_
 - 39 yR_38,source1,plantin,vehicle,apple_
 - 40 yR_39,source1,plantin,vehicle,apple_
 - 5 yR_4,source1,plantin,vehicle,apple_
 - 41 yR_40,source1,plantin,vehicle,apple_
 - 42 yR_41,source1,plantin,vehicle,apple_
 - 43 yR_42,source1,plantin,vehicle,apple_
 - 44 yR_43,source1,plantin,vehicle,apple_
 - 45 yR_44,source1,plantin,vehicle,apple_
 - 46 yR_45,source1,plantin,vehicle,apple_
 - 47 yR_46,source1,plantin,vehicle,apple_
 - 48 yR_47,source1,plantin,vehicle,apple_
 - 49 yR_48,source1,plantin,vehicle,apple_
 - 50 yR_49,source1,plantin,vehicle,apple_
 - 6 yR_5,source1,plantin,vehicle,apple_
 - 7 yR_6,source1,plantin,vehicle,apple_
 - 8 yR_7,source1,plantin,vehicle,apple_
 - 9 yR_8,source1,plantin,vehicle,apple_
 - 10 yR_9,source1,plantin,vehicle,apple_ = 0
_C119: f,source1,plantin,vehicle,apple = 0
_C12: yL_9,plantout,customer,vehicle,juice1_
 + yR_9,plantout,customer,vehicle,juice1_
 - z_9,plantout,customer,vehicle,juice1_ = 0
_C120: yL_0,source1,plantin,vehicle,apple_
 + yR_0,source1,plantin,vehicle,apple_ - z_0,source1,plantin,vehicle,apple_
 = 0
_C121: yL_1,source1,plantin,vehicle,apple_
 + yR_1,source1,plantin,vehicle,apple_ - z_1,source1,plantin,vehicle,apple_
 = 0
_C122: yL_2,source1,plantin,vehicle,apple_
 + yR_2,source1,plantin,vehicle,apple_ - z_2,source1,plantin,vehicle,apple_
 = 0
_C123: yL_3,source1,plantin,vehicle,apple_
 + yR_3,source1,plantin,vehicle,apple_ - z_3,source1,plantin,vehicle,apple_
 = 0
_C124: yL_4,source1,plantin,vehicle,apple_
 + yR_4,source1,plantin,vehicle,apple_ - z_4,source1,plantin,vehicle,apple_
 = 0
_C125: yL_5,source1,plantin,vehicle,apple_
 + yR_5,source1,plantin,vehicle,apple_ - z_5,source1,plantin,vehicle,apple_
 = 0
_C126: yL_6,source1,plantin,vehicle,apple_
 + yR_6,source1,plantin,vehicle,apple_ - z_6,source1,plantin,vehicle,apple_
 = 0
_C127: yL_7,source1,plantin,vehicle,apple_
 + yR_7,source1,plantin,vehicle,apple_ - z_7,source1,plantin,vehicle,apple_
 = 0
_C128: yL_8,source1,plantin,vehicle,apple_
 + yR_8,source1,plantin,vehicle,apple_ - z_8,source1,plantin,vehicle,apple_
 = 0
_C129: yL_9,source1,plantin,vehicle,apple_
 + yR_9,source1,plantin,vehicle,apple_ - z_9,source1,plantin,vehicle,apple_
 = 0
_C13: z_0,plantout,customer,vehicle,juice1_
 + z_1,plantout,customer,vehicle,juice1_
 + z_2,plantout,customer,vehicle,juice1_
 + z_3,plantout,customer,vehicle,juice1_
 + z_4,plantout,customer,vehicle,juice1_
 + z_5,plantout,customer,vehicle,juice1_
 + z_6,plantout,customer,vehicle,juice1_
 + z_7,plantout,customer,vehicle,juice1_
 + z_8,plantout,customer,vehicle,juice1_
 + z_9,plantout,customer,vehicle,juice1_ = 1
_C130: yL_10,source1,plantin,vehicle,apple_
 + yR_10,source1,plantin,vehicle,apple_ - z_10,source1,plantin,vehicle,apple_
 = 0
_C131: yL_11,source1,plantin,vehicle,apple_
 + yR_11,source1,plantin,vehicle,apple_ - z_11,source1,plantin,vehicle,apple_
 = 0
_C132: yL_12,source1,plantin,vehicle,apple_
 + yR_12,source1,plantin,vehicle,apple_ - z_12,source1,plantin,vehicle,apple_
 = 0
_C133: yL_13,source1,plantin,vehicle,apple_
 + yR_13,source1,plantin,vehicle,apple_ - z_13,source1,plantin,vehicle,apple_
 = 0
_C134: yL_14,source1,plantin,vehicle,apple_
 + yR_14,source1,plantin,vehicle,apple_ - z_14,source1,plantin,vehicle,apple_
 = 0
_C135: yL_15,source1,plantin,vehicle,apple_
 + yR_15,source1,plantin,vehicle,apple_ - z_15,source1,plantin,vehicle,apple_
 = 0
_C136: yL_16,source1,plantin,vehicle,apple_
 + yR_16,source1,plantin,vehicle,apple_ - z_16,source1,plantin,vehicle,apple_
 = 0
_C137: yL_17,source1,plantin,vehicle,apple_
 + yR_17,source1,plantin,vehicle,apple_ - z_17,source1,plantin,vehicle,apple_
 = 0
_C138: yL_18,source1,plantin,vehicle,apple_
 + yR_18,source1,plantin,vehicle,apple_ - z_18,source1,plantin,vehicle,apple_
 = 0
_C139: yL_19,source1,plantin,vehicle,apple_
 + yR_19,source1,plantin,vehicle,apple_ - z_19,source1,plantin,vehicle,apple_
 = 0
_C14: x,plantin,sink,ship,glass - yL_1,plantin,sink,ship,glass_
 - 2 yL_2,plantin,sink,ship,glass_ - 3 yL_3,plantin,sink,ship,glass_
 - 4 yL_4,plantin,sink,ship,glass_ - 5 yL_5,plantin,sink,ship,glass_
 - 6 yL_6,plantin,sink,ship,glass_ - 7 yL_7,plantin,sink,ship,glass_
 - 8 yL_8,plantin,sink,ship,glass_ - 9 yL_9,plantin,sink,ship,glass_
 - yR_0,plantin,sink,ship,glass_ - 2 yR_1,plantin,sink,ship,glass_
 - 3 yR_2,plantin,sink,ship,glass_ - 4 yR_3,plantin,sink,ship,glass_
 - 5 yR_4,plantin,sink,ship,glass_ - 6 yR_5,plantin,sink,ship,glass_
 - 7 yR_6,plantin,sink,ship,glass_ - 8 yR_7,plantin,sink,ship,glass_
 - 9 yR_8,plantin,sink,ship,glass_ - 10 yR_9,plantin,sink,ship,glass_ = 0
_C140: yL_20,source1,plantin,vehicle,apple_
 + yR_20,source1,plantin,vehicle,apple_ - z_20,source1,plantin,vehicle,apple_
 = 0
_C141: yL_21,source1,plantin,vehicle,apple_
 + yR_21,source1,plantin,vehicle,apple_ - z_21,source1,plantin,vehicle,apple_
 = 0
_C142: yL_22,source1,plantin,vehicle,apple_
 + yR_22,source1,plantin,vehicle,apple_ - z_22,source1,plantin,vehicle,apple_
 = 0
_C143: yL_23,source1,plantin,vehicle,apple_
 + yR_23,source1,plantin,vehicle,apple_ - z_23,source1,plantin,vehicle,apple_
 = 0
_C144: yL_24,source1,plantin,vehicle,apple_
 + yR_24,source1,plantin,vehicle,apple_ - z_24,source1,plantin,vehicle,apple_
 = 0
_C145: yL_25,source1,plantin,vehicle,apple_
 + yR_25,source1,plantin,vehicle,apple_ - z_25,source1,plantin,vehicle,apple_
 = 0
_C146: yL_26,source1,plantin,vehicle,apple_
 + yR_26,source1,plantin,vehicle,apple_ - z_26,source1,plantin,vehicle,apple_
 = 0
_C147: yL_27,source1,plantin,vehicle,apple_
 + yR_27,source1,plantin,vehicle,apple_ - z_27,source1,plantin,vehicle,apple_
 = 0
_C148: yL_28,source1,plantin,vehicle,apple_
 + yR_28,source1,plantin,vehicle,apple_ - z_28,source1,plantin,vehicle,apple_
 = 0
_C149: yL_29,source1,plantin,vehicle,apple_
 + yR_29,source1,plantin,vehicle,apple_ - z_29,source1,plantin,vehicle,apple_
 = 0
_C15: f,plantin,sink,ship,glass = 0
_C150: yL_30,source1,plantin,vehicle,apple_
 + yR_30,source1,plantin,vehicle,apple_ - z_30,source1,plantin,vehicle,apple_
 = 0
_C151: yL_31,source1,plantin,vehicle,apple_
 + yR_31,source1,plantin,vehicle,apple_ - z_31,source1,plantin,vehicle,apple_
 = 0
_C152: yL_32,source1,plantin,vehicle,apple_
 + yR_32,source1,plantin,vehicle,apple_ - z_32,source1,plantin,vehicle,apple_
 = 0
_C153: yL_33,source1,plantin,vehicle,apple_
 + yR_33,source1,plantin,vehicle,apple_ - z_33,source1,plantin,vehicle,apple_
 = 0
_C154: yL_34,source1,plantin,vehicle,apple_
 + yR_34,source1,plantin,vehicle,apple_ - z_34,source1,plantin,vehicle,apple_
 = 0
_C155: yL_35,source1,plantin,vehicle,apple_
 + yR_35,source1,plantin,vehicle,apple_ - z_35,source1,plantin,vehicle,apple_
 = 0
_C156: yL_36,source1,plantin,vehicle,apple_
 + yR_36,source1,plantin,vehicle,apple_ - z_36,source1,plantin,vehicle,apple_
 = 0
_C157: yL_37,source1,plantin,vehicle,apple_
 + yR_37,source1,plantin,vehicle,apple_ - z_37,source1,plantin,vehicle,apple_
 = 0
_C158: yL_38,source1,plantin,vehicle,apple_
 + yR_38,source1,plantin,vehicle,apple_ - z_38,source1,plantin,vehicle,apple_
 = 0
_C159: yL_39,source1,plantin,vehicle,apple_
 + yR_39,source1,plantin,vehicle,apple_ - z_39,source1,plantin,vehicle,apple_
 = 0
_C16: yL_0,plantin,sink,ship,glass_ + yR_0,plantin,sink,ship,glass_
 - z_0,plantin,sink,ship,glass_ = 0
_C160: yL_40,source1,plantin,vehicle,apple_
 + yR_40,source1,plantin,vehicle,apple_ - z_40,source1,plantin,vehicle,apple_
 = 0
_C161: yL_41,source1,plantin,vehicle,apple_
 + yR_41,source1,plantin,vehicle,apple_ - z_41,source1,plantin,vehicle,apple_
 = 0
_C162: yL_42,source1,plantin,vehicle,apple_
 + yR_42,source1,plantin,vehicle,apple_ - z_42,source1,plantin,vehicle,apple_
 = 0
_C163: yL_43,source1,plantin,vehicle,apple_
 + yR_43,source1,plantin,vehicle,apple_ - z_43,source1,plantin,vehicle,apple_
 = 0
_C164: yL_44,source1,plantin,vehicle,apple_
 + yR_44,source1,plantin,vehicle,apple_ - z_44,source1,plantin,vehicle,apple_
 = 0
_C165: yL_45,source1,plantin,vehicle,apple_
 + yR_45,source1,plantin,vehicle,apple_ - z_45,source1,plantin,vehicle,apple_
 = 0
_C166: yL_46,source1,plantin,vehicle,apple_
 + yR_46,source1,plantin,vehicle,apple_ - z_46,source1,plantin,vehicle,apple_
 = 0
_C167: yL_47,source1,plantin,vehicle,apple_
 + yR_47,source1,plantin,vehicle,apple_ - z_47,source1,plantin,vehicle,apple_
 = 0
_C168: yL_48,source1,plantin,vehicle,apple_
 + yR_48,source1,plantin,vehicle,apple_ - z_48,source1,plantin,vehicle,apple_
 = 0
_C169: yL_49,source1,plantin,vehicle,apple_
 + yR_49,source1,plantin,vehicle,apple_ - z_49,source1,plantin,vehicle,apple_
 = 0
_C17: yL_1,plantin,sink,ship,glass_ + yR_1,plantin,sink,ship,glass_
 - z_1,plantin,sink,ship,glass_ = 0
_C170: z_0,source1,plantin,vehicle,apple_ + z_1,source1,plantin,vehicle,apple_
 + z_10,source1,plantin,vehicle,apple_ + z_11,source1,plantin,vehicle,apple_
 + z_12,source1,plantin,vehicle,apple_ + z_13,source1,plantin,vehicle,apple_
 + z_14,source1,plantin,vehicle,apple_ + z_15,source1,plantin,vehicle,apple_
 + z_16,source1,plantin,vehicle,apple_ + z_17,source1,plantin,vehicle,apple_
 + z_18,source1,plantin,vehicle,apple_ + z_19,source1,plantin,vehicle,apple_
 + z_2,source1,plantin,vehicle,apple_ + z_20,source1,plantin,vehicle,apple_
 + z_21,source1,plantin,vehicle,apple_ + z_22,source1,plantin,vehicle,apple_
 + z_23,source1,plantin,vehicle,apple_ + z_24,source1,plantin,vehicle,apple_
 + z_25,source1,plantin,vehicle,apple_ + z_26,source1,plantin,vehicle,apple_
 + z_27,source1,plantin,vehicle,apple_ + z_28,source1,plantin,vehicle,apple_
 + z_29,source1,plantin,vehicle,apple_ + z_3,source1,plantin,vehicle,apple_
 + z_30,source1,plantin,vehicle,apple_ + z_31,source1,plantin,vehicle,apple_
 + z_32,source1,plantin,vehicle,apple_ + z_33,source1,plantin,vehicle,apple_
 + z_34,source1,plantin,vehicle,apple_ + z_35,source1,plantin,vehicle,apple_
 + z_36,source1,plantin,vehicle,apple_ + z_37,source1,plantin,vehicle,apple_
 + z_38,source1,plantin,vehicle,apple_ + z_39,source1,plantin,vehicle,apple_
 + z_4,source1,plantin,vehicle,apple_ + z_40,source1,plantin,vehicle,apple_
 + z_41,source1,plantin,vehicle,apple_ + z_42,source1,plantin,vehicle,apple_
 + z_43,source1,plantin,vehicle,apple_ + z_44,source1,plantin,vehicle,apple_
 + z_45,source1,plantin,vehicle,apple_ + z_46,source1,plantin,vehicle,apple_
 + z_47,source1,plantin,vehicle,apple_ + z_48,source1,plantin,vehicle,apple_
 + z_49,source1,plantin,vehicle,apple_ + z_5,source1,plantin,vehicle,apple_
 + z_6,source1,plantin,vehicle,apple_ + z_7,source1,plantin,vehicle,apple_
 + z_8,source1,plantin,vehicle,apple_ + z_9,source1,plantin,vehicle,apple_ = 1
_C171: x,plantout,customer,ship,juice1 - yL_1,plantout,customer,ship,juice1_
 - 2 yL_2,plantout,customer,ship,juice1_
 - 3 yL_3,plantout,customer,ship,juice1_
 - 4 yL_4,plantout,customer,ship,juice1_
 - 5 yL_5,plantout,customer,ship,juice1_
 - 6 yL_6,plantout,customer,ship,juice1_
 - 7 yL_7,plantout,customer,ship,juice1_
 - 8 yL_8,plantout,customer,ship,juice1_
 - 9 yL_9,plantout,customer,ship,juice1_ - yR_0,plantout,customer,ship,juice1_
 - 2 yR_1,plantout,customer,ship,juice1_
 - 3 yR_2,plantout,customer,ship,juice1_
 - 4 yR_3,plantout,customer,ship,juice1_
 - 5 yR_4,plantout,customer,ship,juice1_
 - 6 yR_5,plantout,customer,ship,juice1_
 - 7 yR_6,plantout,customer,ship,juice1_
 - 8 yR_7,plantout,customer,ship,juice1_
 - 9 yR_8,plantout,customer,ship,juice1_
 - 10 yR_9,plantout,customer,ship,juice1_ = 0
_C172: f,plantout,customer,ship,juice1
 - 62.7217067689 yL_1,plantout,customer,ship,juice1_
 - 88.7018883677 yL_2,plantout,customer,ship,juice1_
 - 108.637182861 yL_3,plantout,customer,ship,juice1_
 - 125.443413538 yL_4,plantout,customer,ship,juice1_
 - 140.25 yL_5,plantout,customer,ship,juice1_
 - 153.63617738 yL_6,plantout,customer,ship,juice1_
 - 165.946037916 yL_7,plantout,customer,ship,juice1_
 - 177.403776735 yL_8,plantout,customer,ship,juice1_
 - 188.165120307 yL_9,plantout,customer,ship,juice1_
 - 62.7217067689 yR_0,plantout,customer,ship,juice1_
 - 88.7018883677 yR_1,plantout,customer,ship,juice1_
 - 108.637182861 yR_2,plantout,customer,ship,juice1_
 - 125.443413538 yR_3,plantout,customer,ship,juice1_
 - 140.25 yR_4,plantout,customer,ship,juice1_
 - 153.63617738 yR_5,plantout,customer,ship,juice1_
 - 165.946037916 yR_6,plantout,customer,ship,juice1_
 - 177.403776735 yR_7,plantout,customer,ship,juice1_
 - 188.165120307 yR_8,plantout,customer,ship,juice1_
 - 198.343452123 yR_9,plantout,customer,ship,juice1_ = 0
_C173: yL_0,plantout,customer,ship,juice1_
 + yR_0,plantout,customer,ship,juice1_ - z_0,plantout,customer,ship,juice1_
 = 0
_C174: yL_1,plantout,customer,ship,juice1_
 + yR_1,plantout,customer,ship,juice1_ - z_1,plantout,customer,ship,juice1_
 = 0
_C175: yL_2,plantout,customer,ship,juice1_
 + yR_2,plantout,customer,ship,juice1_ - z_2,plantout,customer,ship,juice1_
 = 0
_C176: yL_3,plantout,customer,ship,juice1_
 + yR_3,plantout,customer,ship,juice1_ - z_3,plantout,customer,ship,juice1_
 = 0
_C177: yL_4,plantout,customer,ship,juice1_
 + yR_4,plantout,customer,ship,juice1_ - z_4,plantout,customer,ship,juice1_
 = 0
_C178: yL_5,plantout,customer,ship,juice1_
 + yR_5,plantout,customer,ship,juice1_ - z_5,plantout,customer,ship,juice1_
 = 0
_C179: yL_6,plantout,customer,ship,juice1_
 + yR_6,plantout,customer,ship,juice1_ - z_6,plantout,customer,ship,juice1_
 = 0
_C18: yL_2,plantin,sink,ship,glass_ + yR_2,plantin,sink,ship,glass_
 - z_2,plantin,sink,ship,glass_ = 0
_C180: yL_7,plantout,customer,ship,juice1_
 + yR_7,plantout,customer,ship,juice1_ - z_7,plantout,customer,ship,juice1_
 = 0
_C181: yL_8,plantout,customer,ship,juice1_
 + yR_8,plantout,customer,ship,juice1_ - z_8,plantout,customer,ship,juice1_
 = 0
_C182: yL_9,plantout,customer,ship,juice1_
 + yR_9,plantout,customer,ship,juice1_ - z_9,plantout,customer,ship,juice1_
 = 0
_C183: z_0,plantout,customer,ship,juice1_ + z_1,plantout,customer,ship,juice1_
 + z_2,plantout,customer,ship,juice1_ + z_3,plantout,customer,ship,juice1_
 + z_4,plantout,customer,ship,juice1_ + z_5,plantout,customer,ship,juice1_
 + z_6,plantout,customer,ship,juice1_ + z_7,plantout,customer,ship,juice1_
 + z_8,plantout,customer,ship,juice1_ + z_9,plantout,customer,ship,juice1_ = 1
_C184: x,plantout,customer,ship,juice2 - yL_1,plantout,customer,ship,juice2_
 - 2 yL_2,plantout,customer,ship,juice2_
 - 3 yL_3,plantout,customer,ship,juice2_
 - 4 yL_4,plantout,customer,ship,juice2_
 - 5 yL_5,plantout,customer,ship,juice2_
 - 6 yL_6,plantout,customer,ship,juice2_
 - 7 yL_7,plantout,customer,ship,juice2_
 - 8 yL_8,plantout,customer,ship,juice2_
 - 9 yL_9,plantout,customer,ship,juice2_ - yR_0,plantout,customer,ship,juice2_
 - 2 yR_1,plantout,customer,ship,juice2_
 - 3 yR_2,plantout,customer,ship,juice2_
 - 4 yR_3,plantout,customer,ship,juice2_
 - 5 yR_4,plantout,customer,ship,juice2_
 - 6 yR_5,plantout,customer,ship,juice2_
 - 7 yR_6,plantout,customer,ship,juice2_
 - 8 yR_7,plantout,customer,ship,juice2_
 - 9 yR_8,plantout,customer,ship,juice2_
 - 10 yR_9,plantout,customer,ship,juice2_ = 0
_C185: f,plantout,customer,ship,juice2
 - 89.1 yL_1,plantout,customer,ship,juice2_
 - 126.006428407 yL_2,plantout,customer,ship,juice2_
 - 154.325726954 yL_3,plantout,customer,ship,juice2_
 - 178.2 yL_4,plantout,customer,ship,juice2_
 - 199.233656795 yL_5,plantout,customer,ship,juice2_
 - 218.249536082 yL_6,plantout,customer,ship,juice2_
 - 235.736441816 yL_7,plantout,customer,ship,juice2_
 - 252.012856815 yL_8,plantout,customer,ship,juice2_
 - 267.3 yL_9,plantout,customer,ship,juice2_
 - 89.1 yR_0,plantout,customer,ship,juice2_
 - 126.006428407 yR_1,plantout,customer,ship,juice2_
 - 154.325726954 yR_2,plantout,customer,ship,juice2_
 - 178.2 yR_3,plantout,customer,ship,juice2_
 - 199.233656795 yR_4,plantout,customer,ship,juice2_
 - 218.249536082 yR_5,plantout,customer,ship,juice2_
 - 235.736441816 yR_6,plantout,customer,ship,juice2_
 - 252.012856815 yR_7,plantout,customer,ship,juice2_
 - 267.3 yR_8,plantout,customer,ship,juice2_
 - 281.758939521 yR_9,plantout,customer,ship,juice2_ = 0
_C186: yL_0,plantout,customer,ship,juice2_
 + yR_0,plantout,customer,ship,juice2_ - z_0,plantout,customer,ship,juice2_
 = 0
_C187: yL_1,plantout,customer,ship,juice2_
 + yR_1,plantout,customer,ship,juice2_ - z_1,plantout,customer,ship,juice2_
 = 0
_C188: yL_2,plantout,customer,ship,juice2_
 + yR_2,plantout,customer,ship,juice2_ - z_2,plantout,customer,ship,juice2_
 = 0
_C189: yL_3,plantout,customer,ship,juice2_
 + yR_3,plantout,customer,ship,juice2_ - z_3,plantout,customer,ship,juice2_
 = 0
_C19: yL_3,plantin,sink,ship,glass_ + yR_3,plantin,sink,ship,glass_
 - z_3,plantin,sink,ship,glass_ = 0
_C190: yL_4,plantout,customer,ship,juice2_
 + yR_4,plantout,customer,ship,juice2_ - z_4,plantout,customer,ship,juice2_
 = 0
_C191: yL_5,plantout,customer,ship,juice2_
 + yR_5,plantout,customer,ship,juice2_ - z_5,plantout,customer,ship,juice2_
 = 0
_C192: yL_6,plantout,customer,ship,juice2_
 + yR_6,plantout,customer,ship,juice2_ - z_6,plantout,customer,ship,juice2_
 = 0
_C193: yL_7,plantout,customer,ship,juice2_
 + yR_7,plantout,customer,ship,juice2_ - z_7,plantout,customer,ship,juice2_
 = 0
_C194: yL_8,plantout,customer,ship,juice2_
 + yR_8,plantout,customer,ship,juice2_ - z_8,plantout,customer,ship,juice2_
 = 0
_C195: yL_9,plantout,customer,ship,juice2_
 + yR_9,plantout,customer,ship,juice2_ - z_9,plantout,customer,ship,juice2_
 = 0
_C196: z_0,plantout,customer,ship,juice2_ + z_1,plantout,customer,ship,juice2_
 + z_2,plantout,customer,ship,juice2_ + z_3,plantout,customer,ship,juice2_
 + z_4,plantout,customer,ship,juice2_ + z_5,plantout,customer,ship,juice2_
 + z_6,plantout,customer,ship,juice2_ + z_7,plantout,customer,ship,juice2_
 + z_8,plantout,customer,ship,juice2_ + z_9,plantout,customer,ship,juice2_ = 1
_C197: x,plantout,customer,vehicle,juice2
 - yL_1,plantout,customer,vehicle,juice2_
 - 2 yL_2,plantout,customer,vehicle,juice2_
 - 3 yL_3,plantout,customer,vehicle,juice2_
 - 4 yL_4,plantout,customer,vehicle,juice2_
 - 5 yL_5,plantout,customer,vehicle,juice2_
 - 6 yL_6,plantout,customer,vehicle,juice2_
 - 7 yL_7,plantout,customer,vehicle,juice2_
 - 8 yL_8,plantout,customer,vehicle,juice2_
 - 9 yL_9,plantout,customer,vehicle,juice2_
 - yR_0,plantout,customer,vehicle,juice2_
 - 2 yR_1,plantout,customer,vehicle,juice2_
 - 3 yR_2,plantout,customer,vehicle,juice2_
 - 4 yR_3,plantout,customer,vehicle,juice2_
 - 5 yR_4,plantout,customer,vehicle,juice2_
 - 6 yR_5,plantout,customer,vehicle,juice2_
 - 7 yR_6,plantout,customer,vehicle,juice2_
 - 8 yR_7,plantout,customer,vehicle,juice2_
 - 9 yR_8,plantout,customer,vehicle,juice2_
 - 10 yR_9,plantout,customer,vehicle,juice2_ = 0
_C198: f,plantout,customer,vehicle,juice2
 - 51.4419089848 yL_1,plantout,customer,vehicle,juice2_
 - 72.7498453607 yL_2,plantout,customer,vehicle,juice2_
 - 89.1 yL_3,plantout,customer,vehicle,juice2_
 - 102.88381797 yL_4,plantout,customer,vehicle,juice2_
 - 115.027605382 yL_5,plantout,customer,vehicle,juice2_
 - 126.006428407 yL_6,plantout,customer,vehicle,juice2_
 - 136.10249814 yL_7,plantout,customer,vehicle,juice2_
 - 145.499690721 yL_8,plantout,customer,vehicle,juice2_
 - 154.325726954 yL_9,plantout,customer,vehicle,juice2_
 - 51.4419089848 yR_0,plantout,customer,vehicle,juice2_
 - 72.7498453607 yR_1,plantout,customer,vehicle,juice2_
 - 89.1 yR_2,plantout,customer,vehicle,juice2_
 - 102.88381797 yR_3,plantout,customer,vehicle,juice2_
 - 115.027605382 yR_4,plantout,customer,vehicle,juice2_
 - 126.006428407 yR_5,plantout,customer,vehicle,juice2_
 - 136.10249814 yR_6,plantout,customer,vehicle,juice2_
 - 145.499690721 yR_7,plantout,customer,vehicle,juice2_
 - 154.325726954 yR_8,plantout,customer,vehicle,juice2_
 - 162.673599579 yR_9,plantout,customer,vehicle,juice2_ = 0
_C199: yL_0,plantout,customer,vehicle,juice2_
 + yR_0,plantout,customer,vehicle,juice2_
 - z_0,plantout,customer,vehicle,juice2_ = 0
_C2: f,plantout,customer,vehicle,juice1
 - 34.3540936425 yL_1,plantout,customer,vehicle,juice1_
 - 48.5840251523 yL_2,plantout,customer,vehicle,juice1_
 - 59.5030356368 yL_3,plantout,customer,vehicle,juice1_
 - 68.7081872851 yL_4,plantout,customer,vehicle,juice1_
 - 76.8180886901 yL_5,plantout,customer,vehicle,juice1_
 - 84.15 yL_6,plantout,customer,vehicle,juice1_
 - 90.8923882952 yL_7,plantout,customer,vehicle,juice1_
 - 97.1680503046 yL_8,plantout,customer,vehicle,juice1_
 - 103.062280928 yL_9,plantout,customer,vehicle,juice1_
 - 34.3540936425 yR_0,plantout,customer,vehicle,juice1_
 - 48.5840251523 yR_1,plantout,customer,vehicle,juice1_
 - 59.5030356368 yR_2,plantout,customer,vehicle,juice1_
 - 68.7081872851 yR_3,plantout,customer,vehicle,juice1_
 - 76.8180886901 yR_4,plantout,customer,vehicle,juice1_
 - 84.15 yR_5,plantout,customer,vehicle,juice1_
 - 90.8923882952 yR_6,plantout,customer,vehicle,juice1_
 - 97.1680503046 yR_7,plantout,customer,vehicle,juice1_
 - 103.062280928 yR_8,plantout,customer,vehicle,juice1_
 - 108.637182861 yR_9,plantout,customer,vehicle,juice1_ = 0
_C20: yL_4,plantin,sink,ship,glass_ + yR_4,plantin,sink,ship,glass_
 - z_4,plantin,sink,ship,glass_ = 0
_C200: yL_1,plantout,customer,vehicle,juice2_
 + yR_1,plantout,customer,vehicle,juice2_
 - z_1,plantout,customer,vehicle,juice2_ = 0
_C201: yL_2,plantout,customer,vehicle,juice2_
 + yR_2,plantout,customer,vehicle,juice2_
 - z_2,plantout,customer,vehicle,juice2_ = 0
_C202: yL_3,plantout,customer,vehicle,juice2_
 + yR_3,plantout,customer,vehicle,juice2_
 - z_3,plantout,customer,vehicle,juice2_ = 0
_C203: yL_4,plantout,customer,vehicle,juice2_
 + yR_4,plantout,customer,vehicle,juice2_
 - z_4,plantout,customer,vehicle,juice2_ = 0
_C204: yL_5,plantout,customer,vehicle,juice2_
 + yR_5,plantout,customer,vehicle,juice2_
 - z_5,plantout,customer,vehicle,juice2_ = 0
_C205: yL_6,plantout,customer,vehicle,juice2_
 + yR_6,plantout,customer,vehicle,juice2_
 - z_6,plantout,customer,vehicle,juice2_ = 0
_C206: yL_7,plantout,customer,vehicle,juice2_
 + yR_7,plantout,customer,vehicle,juice2_
 - z_7,plantout,customer,vehicle,juice2_ = 0
_C207: yL_8,plantout,customer,vehicle,juice2_
 + yR_8,plantout,customer,vehicle,juice2_
 - z_8,plantout,customer,vehicle,juice2_ = 0
_C208: yL_9,plantout,customer,vehicle,juice2_
 + yR_9,plantout,customer,vehicle,juice2_
 - z_9,plantout,customer,vehicle,juice2_ = 0
_C209: z_0,plantout,customer,vehicle,juice2_
 + z_1,plantout,customer,vehicle,juice2_
 + z_2,plantout,customer,vehicle,juice2_
 + z_3,plantout,customer,vehicle,juice2_
 + z_4,plantout,customer,vehicle,juice2_
 + z_5,plantout,customer,vehicle,juice2_
 + z_6,plantout,customer,vehicle,juice2_
 + z_7,plantout,customer,vehicle,juice2_
 + z_8,plantout,customer,vehicle,juice2_
 + z_9,plantout,customer,vehicle,juice2_ = 1
_C21: yL_5,plantin,sink,ship,glass_ + yR_5,plantin,sink,ship,glass_
 - z_5,plantin,sink,ship,glass_ = 0
_C210: x,source1,plantin,vehicle,melon - yL_1,source1,plantin,vehicle,melon_
 - 10 yL_10,source1,plantin,vehicle,melon_
 - 11 yL_11,source1,plantin,vehicle,melon_
 - 12 yL_12,source1,plantin,vehicle,melon_
 - 13 yL_13,source1,plantin,vehicle,melon_
 - 14 yL_14,source1,plantin,vehicle,melon_
 - 15 yL_15,source1,plantin,vehicle,melon_
 - 16 yL_16,source1,plantin,vehicle,melon_
 - 17 yL_17,source1,plantin,vehicle,melon_
 - 18 yL_18,source1,plantin,vehicle,melon_
 - 19 yL_19,source1,plantin,vehicle,melon_
 - 2 yL_2,source1,plantin,vehicle,melon_
 - 20 yL_20,source1,plantin,vehicle,melon_
 - 21 yL_21,source1,plantin,vehicle,melon_
 - 22 yL_22,source1,plantin,vehicle,melon_
 - 23 yL_23,source1,plantin,vehicle,melon_
 - 24 yL_24,source1,plantin,vehicle,melon_
 - 25 yL_25,source1,plantin,vehicle,melon_
 - 26 yL_26,source1,plantin,vehicle,melon_
 - 27 yL_27,source1,plantin,vehicle,melon_
 - 28 yL_28,source1,plantin,vehicle,melon_
 - 29 yL_29,source1,plantin,vehicle,melon_
 - 3 yL_3,source1,plantin,vehicle,melon_
 - 30 yL_30,source1,plantin,vehicle,melon_
 - 31 yL_31,source1,plantin,vehicle,melon_
 - 32 yL_32,source1,plantin,vehicle,melon_
 - 33 yL_33,source1,plantin,vehicle,melon_
 - 34 yL_34,source1,plantin,vehicle,melon_
 - 35 yL_35,source1,plantin,vehicle,melon_
 - 36 yL_36,source1,plantin,vehicle,melon_
 - 37 yL_37,source1,plantin,vehicle,melon_
 - 38 yL_38,source1,plantin,vehicle,melon_
 - 39 yL_39,source1,plantin,vehicle,melon_
 - 4 yL_4,source1,plantin,vehicle,melon_
 - 40 yL_40,source1,plantin,vehicle,melon_
 - 41 yL_41,source1,plantin,vehicle,melon_
 - 42 yL_42,source1,plantin,vehicle,melon_
 - 43 yL_43,source1,plantin,vehicle,melon_
 - 44 yL_44,source1,plantin,vehicle,melon_
 - 45 yL_45,source1,plantin,vehicle,melon_
 - 46 yL_46,source1,plantin,vehicle,melon_
 - 47 yL_47,source1,plantin,vehicle,melon_
 - 48 yL_48,source1,plantin,vehicle,melon_
 - 49 yL_49,source1,plantin,vehicle,melon_
 - 5 yL_5,source1,plantin,vehicle,melon_
 - 6 yL_6,source1,plantin,vehicle,melon_
 - 7 yL_7,source1,plantin,vehicle,melon_
 - 8 yL_8,source1,plantin,vehicle,melon_
 - 9 yL_9,source1,plantin,vehicle,melon_ - yR_0,source1,plantin,vehicle,melon_
 - 2 yR_1,source1,plantin,vehicle,melon_
 - 11 yR_10,source1,plantin,vehicle,melon_
 - 12 yR_11,source1,plantin,vehicle,melon_
 - 13 yR_12,source1,plantin,vehicle,melon_
 - 14 yR_13,source1,plantin,vehicle,melon_
 - 15 yR_14,source1,plantin,vehicle,melon_
 - 16 yR_15,source1,plantin,vehicle,melon_
 - 17 yR_16,source1,plantin,vehicle,melon_
 - 18 yR_17,source1,plantin,vehicle,melon_
 - 19 yR_18,source1,plantin,vehicle,melon_
 - 20 yR_19,source1,plantin,vehicle,melon_
 - 3 yR_2,source1,plantin,vehicle,melon_
 - 21 yR_20,source1,plantin,vehicle,melon_
 - 22 yR_21,source1,plantin,vehicle,melon_
 - 23 yR_22,source1,plantin,vehicle,melon_
 - 24 yR_23,source1,plantin,vehicle,melon_
 - 25 yR_24,source1,plantin,vehicle,melon_
 - 26 yR_25,source1,plantin,vehicle,melon_
 - 27 yR_26,source1,plantin,vehicle,melon_
 - 28 yR_27,source1,plantin,vehicle,melon_
 - 29 yR_28,source1,plantin,vehicle,melon_
 - 30 yR_29,source1,plantin,vehicle,melon_
 - 4 yR_3,source1,plantin,vehicle,melon_
 - 31 yR_30,source1,plantin,vehicle,melon_
 - 32 yR_31,source1,plantin,vehicle,melon_
 - 33 yR_32,source1,plantin,vehicle,melon_
 - 34 yR_33,source1,plantin,vehicle,melon_
 - 35 yR_34,source1,plantin,vehicle,melon_
 - 36 yR_35,source1,plantin,vehicle,melon_
 - 37 yR_36,source1,plantin,vehicle,melon_
 - 38 yR_37,source1,plantin,vehicle,melon_
 - 39 yR_38,source1,plantin,vehicle,melon_
 - 40 yR_39,source1,plantin,vehicle,melon_
 - 5 yR_4,source1,plantin,vehicle,melon_
 - 41 yR_40,source1,plantin,vehicle,melon_
 - 42 yR_41,source1,plantin,vehicle,melon_
 - 43 yR_42,source1,plantin,vehicle,melon_
 - 44 yR_43,source1,plantin,vehicle,melon_
 - 45 yR_44,source1,plantin,vehicle,melon_
 - 46 yR_45,source1,plantin,vehicle,melon_
 - 47 yR_46,source1,plantin,vehicle,melon_
 - 48 yR_47,source1,plantin,vehicle,melon_
 - 49 yR_48,source1,plantin,vehicle,melon_
 - 50 yR_49,source1,plantin,vehicle,melon_
 - 6 yR_5,source1,plantin,vehicle,melon_
 - 7 yR_6,source1,plantin,vehicle,melon_
 - 8 yR_7,source1,plantin,vehicle,melon_
 - 9 yR_8,source1,plantin,vehicle,melon_
 - 10 yR_9,source1,plantin,vehicle,melon_ = 0
_C211: f,source1,plantin,vehicle,melon = 0
_C212: yL_0,source1,plantin,vehicle,melon_
 + yR_0,source1,plantin,vehicle,melon_ - z_0,source1,plantin,vehicle,melon_
 = 0
_C213: yL_1,source1,plantin,vehicle,melon_
 + yR_1,source1,plantin,vehicle,melon_ - z_1,source1,plantin,vehicle,melon_
 = 0
_C214: yL_2,source1,plantin,vehicle,melon_
 + yR_2,source1,plantin,vehicle,melon_ - z_2,source1,plantin,vehicle,melon_
 = 0
_C215: yL_3,source1,plantin,vehicle,melon_
 + yR_3,source1,plantin,vehicle,melon_ - z_3,source1,plantin,vehicle,melon_
 = 0
_C216: yL_4,source1,plantin,vehicle,melon_
 + yR_4,source1,plantin,vehicle,melon_ - z_4,source1,plantin,vehicle,melon_
 = 0
_C217: yL_5,source1,plantin,vehicle,melon_
 + yR_5,source1,plantin,vehicle,melon_ - z_5,source1,plantin,vehicle,melon_
 = 0
_C218: yL_6,source1,plantin,vehicle,melon_
 + yR_6,source1,plantin,vehicle,melon_ - z_6,source1,plantin,vehicle,melon_
 = 0
_C219: yL_7,source1,plantin,vehicle,melon_
 + yR_7,source1,plantin,vehicle,melon_ - z_7,source1,plantin,vehicle,melon_
 = 0
_C22: yL_6,plantin,sink,ship,glass_ + yR_6,plantin,sink,ship,glass_
 - z_6,plantin,sink,ship,glass_ = 0
_C220: yL_8,source1,plantin,vehicle,melon_
 + yR_8,source1,plantin,vehicle,melon_ - z_8,source1,plantin,vehicle,melon_
 = 0
_C221: yL_9,source1,plantin,vehicle,melon_
 + yR_9,source1,plantin,vehicle,melon_ - z_9,source1,plantin,vehicle,melon_
 = 0
_C222: yL_10,source1,plantin,vehicle,melon_
 + yR_10,source1,plantin,vehicle,melon_ - z_10,source1,plantin,vehicle,melon_
 = 0
_C223: yL_11,source1,plantin,vehicle,melon_
 + yR_11,source1,plantin,vehicle,melon_ - z_11,source1,plantin,vehicle,melon_
 = 0
_C224: yL_12,source1,plantin,vehicle,melon_
 + yR_12,source1,plantin,vehicle,melon_ - z_12,source1,plantin,vehicle,melon_
 = 0
_C225: yL_13,source1,plantin,vehicle,melon_
 + yR_13,source1,plantin,vehicle,melon_ - z_13,source1,plantin,vehicle,melon_
 = 0
_C226: yL_14,source1,plantin,vehicle,melon_
 + yR_14,source1,plantin,vehicle,melon_ - z_14,source1,plantin,vehicle,melon_
 = 0
_C227: yL_15,source1,plantin,vehicle,melon_
 + yR_15,source1,plantin,vehicle,melon_ - z_15,source1,plantin,vehicle,melon_
 = 0
_C228: yL_16,source1,plantin,vehicle,melon_
 + yR_16,source1,plantin,vehicle,melon_ - z_16,source1,plantin,vehicle,melon_
 = 0
_C229: yL_17,source1,plantin,vehicle,melon_
 + yR_17,source1,plantin,vehicle,melon_ - z_17,source1,plantin,vehicle,melon_
 = 0
_C23: yL_7,plantin,sink,ship,glass_ + yR_7,plantin,sink,ship,glass_
 - z_7,plantin,sink,ship,glass_ = 0
_C230: yL_18,source1,plantin,vehicle,melon_
 + yR_18,source1,plantin,vehicle,melon_ - z_18,source1,plantin,vehicle,melon_
 = 0
_C231: yL_19,source1,plantin,vehicle,melon_
 + yR_19,source1,plantin,vehicle,melon_ - z_19,source1,plantin,vehicle,melon_
 = 0
_C232: yL_20,source1,plantin,vehicle,melon_
 + yR_20,source1,plantin,vehicle,melon_ - z_20,source1,plantin,vehicle,melon_
 = 0
_C233: yL_21,source1,plantin,vehicle,melon_
 + yR_21,source1,plantin,vehicle,melon_ - z_21,source1,plantin,vehicle,melon_
 = 0
_C234: yL_22,source1,plantin,vehicle,melon_
 + yR_22,source1,plantin,vehicle,melon_ - z_22,source1,plantin,vehicle,melon_
 = 0
_C235: yL_23,source1,plantin,vehicle,melon_
 + yR_23,source1,plantin,vehicle,melon_ - z_23,source1,plantin,vehicle,melon_
 = 0
_C236: yL_24,source1,plantin,vehicle,melon_
 + yR_24,source1,plantin,vehicle,melon_ - z_24,source1,plantin,vehicle,melon_
 = 0
_C237: yL_25,source1,plantin,vehicle,melon_
 + yR_25,source1,plantin,vehicle,melon_ - z_25,source1,plantin,vehicle,melon_
 = 0
_C238: yL_26,source1,plantin,vehicle,melon_
 + yR_26,source1,plantin,vehicle,melon_ - z_26,source1,plantin,vehicle,melon_
 = 0
_C239: yL_27,source1,plantin,vehicle,melon_
 + yR_27,source1,plantin,vehicle,melon_ - z_27,source1,plantin,vehicle,melon_
 = 0
_C24: yL_8,plantin,sink,ship,glass_ + yR_8,plantin,sink,ship,glass_
 - z_8,plantin,sink,ship,glass_ = 0
_C240: yL_28,source1,plantin,vehicle,melon_
 + yR_28,source1,plantin,vehicle,melon_ - z_28,source1,plantin,vehicle,melon_
 = 0
_C241: yL_29,source1,plantin,vehicle,melon_
 + yR_29,source1,plantin,vehicle,melon_ - z_29,source1,plantin,vehicle,melon_
 = 0
_C242: yL_30,source1,plantin,vehicle,melon_
 + yR_30,source1,plantin,vehicle,melon_ - z_30,source1,plantin,vehicle,melon_
 = 0
_C243: yL_31,source1,plantin,vehicle,melon_
 + yR_31,source1,plantin,vehicle,melon_ - z_31,source1,plantin,vehicle,melon_
 = 0
_C244: yL_32,source1,plantin,vehicle,melon_
 + yR_32,source1,plantin,vehicle,melon_ - z_32,source1,plantin,vehicle,melon_
 = 0
_C245: yL_33,source1,plantin,vehicle,melon_
 + yR_33,source1,plantin,vehicle,melon_ - z_33,source1,plantin,vehicle,melon_
 = 0
_C246: yL_34,source1,plantin,vehicle,melon_
 + yR_34,source1,plantin,vehicle,melon_ - z_34,source1,plantin,vehicle,melon_
 = 0
_C247: yL_35,source1,plantin,vehicle,melon_
 + yR_35,source1,plantin,vehicle,melon_ - z_35,source1,plantin,vehicle,melon_
 = 0
_C248: yL_36,source1,plantin,vehicle,melon_
 + yR_36,source1,plantin,vehicle,melon_ - z_36,source1,plantin,vehicle,melon_
 = 0
_C249: yL_37,source1,plantin,vehicle,melon_
 + yR_37,source1,plantin,vehicle,melon_ - z_37,source1,plantin,vehicle,melon_
 = 0
_C25: yL_9,plantin,sink,ship,glass_ + yR_9,plantin,sink,ship,glass_
 - z_9,plantin,sink,ship,glass_ = 0
_C250: yL_38,source1,plantin,vehicle,melon_
 + yR_38,source1,plantin,vehicle,melon_ - z_38,source1,plantin,vehicle,melon_
 = 0
_C251: yL_39,source1,plantin,vehicle,melon_
 + yR_39,source1,plantin,vehicle,melon_ - z_39,source1,plantin,vehicle,melon_
 = 0
_C252: yL_40,source1,plantin,vehicle,melon_
 + yR_40,source1,plantin,vehicle,melon_ - z_40,source1,plantin,vehicle,melon_
 = 0
_C253: yL_41,source1,plantin,vehicle,melon_
 + yR_41,source1,plantin,vehicle,melon_ - z_41,source1,plantin,vehicle,melon_
 = 0
_C254: yL_42,source1,plantin,vehicle,melon_
 + yR_42,source1,plantin,vehicle,melon_ - z_42,source1,plantin,vehicle,melon_
 = 0
_C255: yL_43,source1,plantin,vehicle,melon_
 + yR_43,source1,plantin,vehicle,melon_ - z_43,source1,plantin,vehicle,melon_
 = 0
_C256: yL_44,source1,plantin,vehicle,melon_
 + yR_44,source1,plantin,vehicle,melon_ - z_44,source1,plantin,vehicle,melon_
 = 0
_C257: yL_45,source1,plantin,vehicle,melon_
 + yR_45,source1,plantin,vehicle,melon_ - z_45,source1,plantin,vehicle,melon_
 = 0
_C258: yL_46,source1,plantin,vehicle,melon_
 + yR_46,source1,plantin,vehicle,melon_ - z_46,source1,plantin,vehicle,melon_
 = 0
_C259: yL_47,source1,plantin,vehicle,melon_
 + yR_47,source1,plantin,vehicle,melon_ - z_47,source1,plantin,vehicle,melon_
 = 0
_C26: z_0,plantin,sink,ship,glass_ + z_1,plantin,sink,ship,glass_
 + z_2,plantin,sink,ship,glass_ + z_3,plantin,sink,ship,glass_
 + z_4,plantin,sink,ship,glass_ + z_5,plantin,sink,ship,glass_
 + z_6,plantin,sink,ship,glass_ + z_7,plantin,sink,ship,glass_
 + z_8,plantin,sink,ship,glass_ + z_9,plantin,sink,ship,glass_ = 1
_C260: yL_48,source1,plantin,vehicle,melon_
 + yR_48,source1,plantin,vehicle,melon_ - z_48,source1,plantin,vehicle,melon_
 = 0
_C261: yL_49,source1,plantin,vehicle,melon_
 + yR_49,source1,plantin,vehicle,melon_ - z_49,source1,plantin,vehicle,melon_
 = 0
_C262: z_0,source1,plantin,vehicle,melon_ + z_1,source1,plantin,vehicle,melon_
 + z_10,source1,plantin,vehicle,melon_ + z_11,source1,plantin,vehicle,melon_
 + z_12,source1,plantin,vehicle,melon_ + z_13,source1,plantin,vehicle,melon_
 + z_14,source1,plantin,vehicle,melon_ + z_15,source1,plantin,vehicle,melon_
 + z_16,source1,plantin,vehicle,melon_ + z_17,source1,plantin,vehicle,melon_
 + z_18,source1,plantin,vehicle,melon_ + z_19,source1,plantin,vehicle,melon_
 + z_2,source1,plantin,vehicle,melon_ + z_20,source1,plantin,vehicle,melon_
 + z_21,source1,plantin,vehicle,melon_ + z_22,source1,plantin,vehicle,melon_
 + z_23,source1,plantin,vehicle,melon_ + z_24,source1,plantin,vehicle,melon_
 + z_25,source1,plantin,vehicle,melon_ + z_26,source1,plantin,vehicle,melon_
 + z_27,source1,plantin,vehicle,melon_ + z_28,source1,plantin,vehicle,melon_
 + z_29,source1,plantin,vehicle,melon_ + z_3,source1,plantin,vehicle,melon_
 + z_30,source1,plantin,vehicle,melon_ + z_31,source1,plantin,vehicle,melon_
 + z_32,source1,plantin,vehicle,melon_ + z_33,source1,plantin,vehicle,melon_
 + z_34,source1,plantin,vehicle,melon_ + z_35,source1,plantin,vehicle,melon_
 + z_36,source1,plantin,vehicle,melon_ + z_37,source1,plantin,vehicle,melon_
 + z_38,source1,plantin,vehicle,melon_ + z_39,source1,plantin,vehicle,melon_
 + z_4,source1,plantin,vehicle,melon_ + z_40,source1,plantin,vehicle,melon_
 + z_41,source1,plantin,vehicle,melon_ + z_42,source1,plantin,vehicle,melon_
 + z_43,source1,plantin,vehicle,melon_ + z_44,source1,plantin,vehicle,melon_
 + z_45,source1,plantin,vehicle,melon_ + z_46,source1,plantin,vehicle,melon_
 + z_47,source1,plantin,vehicle,melon_ + z_48,source1,plantin,vehicle,melon_
 + z_49,source1,plantin,vehicle,melon_ + z_5,source1,plantin,vehicle,melon_
 + z_6,source1,plantin,vehicle,melon_ + z_7,source1,plantin,vehicle,melon_
 + z_8,source1,plantin,vehicle,melon_ + z_9,source1,plantin,vehicle,melon_ = 1
_C263: x,source2,plantin,ship,bottle - yL_1,source2,plantin,ship,bottle_
 - 10 yL_10,source2,plantin,ship,bottle_
 - 11 yL_11,source2,plantin,ship,bottle_
 - 12 yL_12,source2,plantin,ship,bottle_
 - 13 yL_13,source2,plantin,ship,bottle_
 - 14 yL_14,source2,plantin,ship,bottle_
 - 15 yL_15,source2,plantin,ship,bottle_
 - 16 yL_16,source2,plantin,ship,bottle_
 - 17 yL_17,source2,plantin,ship,bottle_
 - 18 yL_18,source2,plantin,ship,bottle_
 - 19 yL_19,source2,plantin,ship,bottle_ - 2 yL_2,source2,plantin,ship,bottle_
 - 20 yL_20,source2,plantin,ship,bottle_
 - 21 yL_21,source2,plantin,ship,bottle_
 - 22 yL_22,source2,plantin,ship,bottle_
 - 23 yL_23,source2,plantin,ship,bottle_
 - 24 yL_24,source2,plantin,ship,bottle_
 - 25 yL_25,source2,plantin,ship,bottle_
 - 26 yL_26,source2,plantin,ship,bottle_
 - 27 yL_27,source2,plantin,ship,bottle_
 - 28 yL_28,source2,plantin,ship,bottle_
 - 29 yL_29,source2,plantin,ship,bottle_ - 3 yL_3,source2,plantin,ship,bottle_
 - 30 yL_30,source2,plantin,ship,bottle_
 - 31 yL_31,source2,plantin,ship,bottle_
 - 32 yL_32,source2,plantin,ship,bottle_
 - 33 yL_33,source2,plantin,ship,bottle_
 - 34 yL_34,source2,plantin,ship,bottle_
 - 35 yL_35,source2,plantin,ship,bottle_
 - 36 yL_36,source2,plantin,ship,bottle_
 - 37 yL_37,source2,plantin,ship,bottle_
 - 38 yL_38,source2,plantin,ship,bottle_
 - 39 yL_39,source2,plantin,ship,bottle_ - 4 yL_4,source2,plantin,ship,bottle_
 - 40 yL_40,source2,plantin,ship,bottle_
 - 41 yL_41,source2,plantin,ship,bottle_
 - 42 yL_42,source2,plantin,ship,bottle_
 - 43 yL_43,source2,plantin,ship,bottle_
 - 44 yL_44,source2,plantin,ship,bottle_
 - 45 yL_45,source2,plantin,ship,bottle_
 - 46 yL_46,source2,plantin,ship,bottle_
 - 47 yL_47,source2,plantin,ship,bottle_
 - 48 yL_48,source2,plantin,ship,bottle_
 - 49 yL_49,source2,plantin,ship,bottle_ - 5 yL_5,source2,plantin,ship,bottle_
 - 6 yL_6,source2,plantin,ship,bottle_ - 7 yL_7,source2,plantin,ship,bottle_
 - 8 yL_8,source2,plantin,ship,bottle_ - 9 yL_9,source2,plantin,ship,bottle_
 - yR_0,source2,plantin,ship,bottle_ - 2 yR_1,source2,plantin,ship,bottle_
 - 11 yR_10,source2,plantin,ship,bottle_
 - 12 yR_11,source2,plantin,ship,bottle_
 - 13 yR_12,source2,plantin,ship,bottle_
 - 14 yR_13,source2,plantin,ship,bottle_
 - 15 yR_14,source2,plantin,ship,bottle_
 - 16 yR_15,source2,plantin,ship,bottle_
 - 17 yR_16,source2,plantin,ship,bottle_
 - 18 yR_17,source2,plantin,ship,bottle_
 - 19 yR_18,source2,plantin,ship,bottle_
 - 20 yR_19,source2,plantin,ship,bottle_ - 3 yR_2,source2,plantin,ship,bottle_
 - 21 yR_20,source2,plantin,ship,bottle_
 - 22 yR_21,source2,plantin,ship,bottle_
 - 23 yR_22,source2,plantin,ship,bottle_
 - 24 yR_23,source2,plantin,ship,bottle_
 - 25 yR_24,source2,plantin,ship,bottle_
 - 26 yR_25,source2,plantin,ship,bottle_
 - 27 yR_26,source2,plantin,ship,bottle_
 - 28 yR_27,source2,plantin,ship,bottle_
 - 29 yR_28,source2,plantin,ship,bottle_
 - 30 yR_29,source2,plantin,ship,bottle_ - 4 yR_3,source2,plantin,ship,bottle_
 - 31 yR_30,source2,plantin,ship,bottle_
 - 32 yR_31,source2,plantin,ship,bottle_
 - 33 yR_32,source2,plantin,ship,bottle_
 - 34 yR_33,source2,plantin,ship,bottle_
 - 35 yR_34,source2,plantin,ship,bottle_
 - 36 yR_35,source2,plantin,ship,bottle_
 - 37 yR_36,source2,plantin,ship,bottle_
 - 38 yR_37,source2,plantin,ship,bottle_
 - 39 yR_38,source2,plantin,ship,bottle_
 - 40 yR_39,source2,plantin,ship,bottle_ - 5 yR_4,source2,plantin,ship,bottle_
 - 41 yR_40,source2,plantin,ship,bottle_
 - 42 yR_41,source2,plantin,ship,bottle_
 - 43 yR_42,source2,plantin,ship,bottle_
 - 44 yR_43,source2,plantin,ship,bottle_
 - 45 yR_44,source2,plantin,ship,bottle_
 - 46 yR_45,source2,plantin,ship,bottle_
 - 47 yR_46,source2,plantin,ship,bottle_
 - 48 yR_47,source2,plantin,ship,bottle_
 - 49 yR_48,source2,plantin,ship,bottle_
 - 50 yR_49,source2,plantin,ship,bottle_ - 6 yR_5,source2,plantin,ship,bottle_
 - 7 yR_6,source2,plantin,ship,bottle_ - 8 yR_7,source2,plantin,ship,bottle_
 - 9 yR_8,source2,plantin,ship,bottle_ - 10 yR_9,source2,plantin,ship,bottle_
 = 0
_C264: f,source2,plantin,ship,bottle = 0
_C265: yL_0,source2,plantin,ship,bottle_ + yR_0,source2,plantin,ship,bottle_
 - z_0,source2,plantin,ship,bottle_ = 0
_C266: yL_1,source2,plantin,ship,bottle_ + yR_1,source2,plantin,ship,bottle_
 - z_1,source2,plantin,ship,bottle_ = 0
_C267: yL_2,source2,plantin,ship,bottle_ + yR_2,source2,plantin,ship,bottle_
 - z_2,source2,plantin,ship,bottle_ = 0
_C268: yL_3,source2,plantin,ship,bottle_ + yR_3,source2,plantin,ship,bottle_
 - z_3,source2,plantin,ship,bottle_ = 0
_C269: yL_4,source2,plantin,ship,bottle_ + yR_4,source2,plantin,ship,bottle_
 - z_4,source2,plantin,ship,bottle_ = 0
_C27: x,plantin,plantout,line2,juice1 - yL_1,plantin,plantout,line2,juice1_
 - 2 yL_2,plantin,plantout,line2,juice1_
 - 3 yL_3,plantin,plantout,line2,juice1_
 - 4 yL_4,plantin,plantout,line2,juice1_
 - 5 yL_5,plantin,plantout,line2,juice1_
 - 6 yL_6,plantin,plantout,line2,juice1_
 - 7 yL_7,plantin,plantout,line2,juice1_
 - 8 yL_8,plantin,plantout,line2,juice1_
 - 9 yL_9,plantin,plantout,line2,juice1_ - yR_0,plantin,plantout,line2,juice1_
 - 2 yR_1,plantin,plantout,line2,juice1_
 - 3 yR_2,plantin,plantout,line2,juice1_
 - 4 yR_3,plantin,plantout,line2,juice1_
 - 5 yR_4,plantin,plantout,line2,juice1_
 - 6 yR_5,plantin,plantout,line2,juice1_
 - 7 yR_6,plantin,plantout,line2,juice1_
 - 8 yR_7,plantin,plantout,line2,juice1_
 - 9 yR_8,plantin,plantout,line2,juice1_
 - 10 yR_9,plantin,plantout,line2,juice1_ = 0
_C270: yL_5,source2,plantin,ship,bottle_ + yR_5,source2,plantin,ship,bottle_
 - z_5,source2,plantin,ship,bottle_ = 0
_C271: yL_6,source2,plantin,ship,bottle_ + yR_6,source2,plantin,ship,bottle_
 - z_6,source2,plantin,ship,bottle_ = 0
_C272: yL_7,source2,plantin,ship,bottle_ + yR_7,source2,plantin,ship,bottle_
 - z_7,source2,plantin,ship,bottle_ = 0
_C273: yL_8,source2,plantin,ship,bottle_ + yR_8,source2,plantin,ship,bottle_
 - z_8,source2,plantin,ship,bottle_ = 0
_C274: yL_9,source2,plantin,ship,bottle_ + yR_9,source2,plantin,ship,bottle_
 - z_9,source2,plantin,ship,bottle_ = 0
_C275: yL_10,source2,plantin,ship,bottle_ + yR_10,source2,plantin,ship,bottle_
 - z_10,source2,plantin,ship,bottle_ = 0
_C276: yL_11,source2,plantin,ship,bottle_ + yR_11,source2,plantin,ship,bottle_
 - z_11,source2,plantin,ship,bottle_ = 0
_C277: yL_12,source2,plantin,ship,bottle_ + yR_12,source2,plantin,ship,bottle_
 - z_12,source2,plantin,ship,bottle_ = 0
_C278: yL_13,source2,plantin,ship,bottle_ + yR_13,source2,plantin,ship,bottle_
 - z_13,source2,plantin,ship,bottle_ = 0
_C279: yL_14,source2,plantin,ship,bottle_ + yR_14,source2,plantin,ship,bottle_
 - z_14,source2,plantin,ship,bottle_ = 0
_C28: f,plantin,plantout,line2,juice1
 - 17.5008928344 yL_1,plantin,plantout,line2,juice1_
 - 24.75 yL_2,plantin,plantout,line2,juice1_
 - 30.3124355669 yL_3,plantin,plantout,line2,juice1_
 - 35.0017856687 yL_4,plantin,plantout,line2,juice1_
 - 39.1331860446 yL_5,plantin,plantout,line2,juice1_
 - 42.8682574873 yL_6,plantin,plantout,line2,juice1_
 - 46.3030101613 yL_7,plantin,plantout,line2,juice1_
 - 49.5 yL_8,plantin,plantout,line2,juice1_
 - 52.5026785031 yL_9,plantin,plantout,line2,juice1_
 - 17.5008928344 yR_0,plantin,plantout,line2,juice1_
 - 24.75 yR_1,plantin,plantout,line2,juice1_
 - 30.3124355669 yR_2,plantin,plantout,line2,juice1_
 - 35.0017856687 yR_3,plantin,plantout,line2,juice1_
 - 39.1331860446 yR_4,plantin,plantout,line2,juice1_
 - 42.8682574873 yR_5,plantin,plantout,line2,juice1_
 - 46.3030101613 yR_6,plantin,plantout,line2,juice1_
 - 49.5 yR_7,plantin,plantout,line2,juice1_
 - 52.5026785031 yR_8,plantin,plantout,line2,juice1_
 - 55.3426824431 yR_9,plantin,plantout,line2,juice1_ = 0
_C280: yL_15,source2,plantin,ship,bottle_ + yR_15,source2,plantin,ship,bottle_
 - z_15,source2,plantin,ship,bottle_ = 0
_C281: yL_16,source2,plantin,ship,bottle_ + yR_16,source2,plantin,ship,bottle_
 - z_16,source2,plantin,ship,bottle_ = 0
_C282: yL_17,source2,plantin,ship,bottle_ + yR_17,source2,plantin,ship,bottle_
 - z_17,source2,plantin,ship,bottle_ = 0
_C283: yL_18,source2,plantin,ship,bottle_ + yR_18,source2,plantin,ship,bottle_
 - z_18,source2,plantin,ship,bottle_ = 0
_C284: yL_19,source2,plantin,ship,bottle_ + yR_19,source2,plantin,ship,bottle_
 - z_19,source2,plantin,ship,bottle_ = 0
_C285: yL_20,source2,plantin,ship,bottle_ + yR_20,source2,plantin,ship,bottle_
 - z_20,source2,plantin,ship,bottle_ = 0
_C286: yL_21,source2,plantin,ship,bottle_ + yR_21,source2,plantin,ship,bottle_
 - z_21,source2,plantin,ship,bottle_ = 0
_C287: yL_22,source2,plantin,ship,bottle_ + yR_22,source2,plantin,ship,bottle_
 - z_22,source2,plantin,ship,bottle_ = 0
_C288: yL_23,source2,plantin,ship,bottle_ + yR_23,source2,plantin,ship,bottle_
 - z_23,source2,plantin,ship,bottle_ = 0
_C289: yL_24,source2,plantin,ship,bottle_ + yR_24,source2,plantin,ship,bottle_
 - z_24,source2,plantin,ship,bottle_ = 0
_C29: yL_0,plantin,plantout,line2,juice1_
 + yR_0,plantin,plantout,line2,juice1_ - z_0,plantin,plantout,line2,juice1_
 = 0
_C290: yL_25,source2,plantin,ship,bottle_ + yR_25,source2,plantin,ship,bottle_
 - z_25,source2,plantin,ship,bottle_ = 0
_C291: yL_26,source2,plantin,ship,bottle_ + yR_26,source2,plantin,ship,bottle_
 - z_26,source2,plantin,ship,bottle_ = 0
_C292: yL_27,source2,plantin,ship,bottle_ + yR_27,source2,plantin,ship,bottle_
 - z_27,source2,plantin,ship,bottle_ = 0
_C293: yL_28,source2,plantin,ship,bottle_ + yR_28,source2,plantin,ship,bottle_
 - z_28,source2,plantin,ship,bottle_ = 0
_C294: yL_29,source2,plantin,ship,bottle_ + yR_29,source2,plantin,ship,bottle_
 - z_29,source2,plantin,ship,bottle_ = 0
_C295: yL_30,source2,plantin,ship,bottle_ + yR_30,source2,plantin,ship,bottle_
 - z_30,source2,plantin,ship,bottle_ = 0
_C296: yL_31,source2,plantin,ship,bottle_ + yR_31,source2,plantin,ship,bottle_
 - z_31,source2,plantin,ship,bottle_ = 0
_C297: yL_32,source2,plantin,ship,bottle_ + yR_32,source2,plantin,ship,bottle_
 - z_32,source2,plantin,ship,bottle_ = 0
_C298: yL_33,source2,plantin,ship,bottle_ + yR_33,source2,plantin,ship,bottle_
 - z_33,source2,plantin,ship,bottle_ = 0
_C299: yL_34,source2,plantin,ship,bottle_ + yR_34,source2,plantin,ship,bottle_
 - z_34,source2,plantin,ship,bottle_ = 0
_C3: yL_0,plantout,customer,vehicle,juice1_
 + yR_0,plantout,customer,vehicle,juice1_
 - z_0,plantout,customer,vehicle,juice1_ = 0
_C30: yL_1,plantin,plantout,line2,juice1_
 + yR_1,plantin,plantout,line2,juice1_ - z_1,plantin,plantout,line2,juice1_
 = 0
_C300: yL_35,source2,plantin,ship,bottle_ + yR_35,source2,plantin,ship,bottle_
 - z_35,source2,plantin,ship,bottle_ = 0
_C301: yL_36,source2,plantin,ship,bottle_ + yR_36,source2,plantin,ship,bottle_
 - z_36,source2,plantin,ship,bottle_ = 0
_C302: yL_37,source2,plantin,ship,bottle_ + yR_37,source2,plantin,ship,bottle_
 - z_37,source2,plantin,ship,bottle_ = 0
_C303: yL_38,source2,plantin,ship,bottle_ + yR_38,source2,plantin,ship,bottle_
 - z_38,source2,plantin,ship,bottle_ = 0
_C304: yL_39,source2,plantin,ship,bottle_ + yR_39,source2,plantin,ship,bottle_
 - z_39,source2,plantin,ship,bottle_ = 0
_C305: yL_40,source2,plantin,ship,bottle_ + yR_40,source2,plantin,ship,bottle_
 - z_40,source2,plantin,ship,bottle_ = 0
_C306: yL_41,source2,plantin,ship,bottle_ + yR_41,source2,plantin,ship,bottle_
 - z_41,source2,plantin,ship,bottle_ = 0
_C307: yL_42,source2,plantin,ship,bottle_ + yR_42,source2,plantin,ship,bottle_
 - z_42,source2,plantin,ship,bottle_ = 0
_C308: yL_43,source2,plantin,ship,bottle_ + yR_43,source2,plantin,ship,bottle_
 - z_43,source2,plantin,ship,bottle_ = 0
_C309: yL_44,source2,plantin,ship,bottle_ + yR_44,source2,plantin,ship,bottle_
 - z_44,source2,plantin,ship,bottle_ = 0
_C31: yL_2,plantin,plantout,line2,juice1_
 + yR_2,plantin,plantout,line2,juice1_ - z_2,plantin,plantout,line2,juice1_
 = 0
_C310: yL_45,source2,plantin,ship,bottle_ + yR_45,source2,plantin,ship,bottle_
 - z_45,source2,plantin,ship,bottle_ = 0
_C311: yL_46,source2,plantin,ship,bottle_ + yR_46,source2,plantin,ship,bottle_
 - z_46,source2,plantin,ship,bottle_ = 0
_C312: yL_47,source2,plantin,ship,bottle_ + yR_47,source2,plantin,ship,bottle_
 - z_47,source2,plantin,ship,bottle_ = 0
_C313: yL_48,source2,plantin,ship,bottle_ + yR_48,source2,plantin,ship,bottle_
 - z_48,source2,plantin,ship,bottle_ = 0
_C314: yL_49,source2,plantin,ship,bottle_ + yR_49,source2,plantin,ship,bottle_
 - z_49,source2,plantin,ship,bottle_ = 0
_C315: z_0,source2,plantin,ship,bottle_ + z_1,source2,plantin,ship,bottle_
 + z_10,source2,plantin,ship,bottle_ + z_11,source2,plantin,ship,bottle_
 + z_12,source2,plantin,ship,bottle_ + z_13,source2,plantin,ship,bottle_
 + z_14,source2,plantin,ship,bottle_ + z_15,source2,plantin,ship,bottle_
 + z_16,source2,plantin,ship,bottle_ + z_17,source2,plantin,ship,bottle_
 + z_18,source2,plantin,ship,bottle_ + z_19,source2,plantin,ship,bottle_
 + z_2,source2,plantin,ship,bottle_ + z_20,source2,plantin,ship,bottle_
 + z_21,source2,plantin,ship,bottle_ + z_22,source2,plantin,ship,bottle_
 + z_23,source2,plantin,ship,bottle_ + z_24,source2,plantin,ship,bottle_
 + z_25,source2,plantin,ship,bottle_ + z_26,source2,plantin,ship,bottle_
 + z_27,source2,plantin,ship,bottle_ + z_28,source2,plantin,ship,bottle_
 + z_29,source2,plantin,ship,bottle_ + z_3,source2,plantin,ship,bottle_
 + z_30,source2,plantin,ship,bottle_ + z_31,source2,plantin,ship,bottle_
 + z_32,source2,plantin,ship,bottle_ + z_33,source2,plantin,ship,bottle_
 + z_34,source2,plantin,ship,bottle_ + z_35,source2,plantin,ship,bottle_
 + z_36,source2,plantin,ship,bottle_ + z_37,source2,plantin,ship,bottle_
 + z_38,source2,plantin,ship,bottle_ + z_39,source2,plantin,ship,bottle_
 + z_4,source2,plantin,ship,bottle_ + z_40,source2,plantin,ship,bottle_
 + z_41,source2,plantin,ship,bottle_ + z_42,source2,plantin,ship,bottle_
 + z_43,source2,plantin,ship,bottle_ + z_44,source2,plantin,ship,bottle_
 + z_45,source2,plantin,ship,bottle_ + z_46,source2,plantin,ship,bottle_
 + z_47,source2,plantin,ship,bottle_ + z_48,source2,plantin,ship,bottle_
 + z_49,source2,plantin,ship,bottle_ + z_5,source2,plantin,ship,bottle_
 + z_6,source2,plantin,ship,bottle_ + z_7,source2,plantin,ship,bottle_
 + z_8,source2,plantin,ship,bottle_ + z_9,source2,plantin,ship,bottle_ = 1
_C32: yL_3,plantin,plantout,line2,juice1_
 + yR_3,plantin,plantout,line2,juice1_ - z_3,plantin,plantout,line2,juice1_
 = 0
_C33: yL_4,plantin,plantout,line2,juice1_
 + yR_4,plantin,plantout,line2,juice1_ - z_4,plantin,plantout,line2,juice1_
 = 0
_C34: yL_5,plantin,plantout,line2,juice1_
 + yR_5,plantin,plantout,line2,juice1_ - z_5,plantin,plantout,line2,juice1_
 = 0
_C35: yL_6,plantin,plantout,line2,juice1_
 + yR_6,plantin,plantout,line2,juice1_ - z_6,plantin,plantout,line2,juice1_
 = 0
_C36: yL_7,plantin,plantout,line2,juice1_
 + yR_7,plantin,plantout,line2,juice1_ - z_7,plantin,plantout,line2,juice1_
 = 0
_C37: yL_8,plantin,plantout,line2,juice1_
 + yR_8,plantin,plantout,line2,juice1_ - z_8,plantin,plantout,line2,juice1_
 = 0
_C38: yL_9,plantin,plantout,line2,juice1_
 + yR_9,plantin,plantout,line2,juice1_ - z_9,plantin,plantout,line2,juice1_
 = 0
_C39: z_0,plantin,plantout,line2,juice1_ + z_1,plantin,plantout,line2,juice1_
 + z_2,plantin,plantout,line2,juice1_ + z_3,plantin,plantout,line2,juice1_
 + z_4,plantin,plantout,line2,juice1_ + z_5,plantin,plantout,line2,juice1_
 + z_6,plantin,plantout,line2,juice1_ + z_7,plantin,plantout,line2,juice1_
 + z_8,plantin,plantout,line2,juice1_ + z_9,plantin,plantout,line2,juice1_ = 1
_C4: yL_1,plantout,customer,vehicle,juice1_
 + yR_1,plantout,customer,vehicle,juice1_
 - z_1,plantout,customer,vehicle,juice1_ = 0
_C40: x,plantout,plantin,line3,retbottle
 - yL_1,plantout,plantin,line3,retbottle_
 - 2 yL_2,plantout,plantin,line3,retbottle_
 - 3 yL_3,plantout,plantin,line3,retbottle_
 - 4 yL_4,plantout,plantin,line3,retbottle_
 - 5 yL_5,plantout,plantin,line3,retbottle_
 - 6 yL_6,plantout,plantin,line3,retbottle_
 - 7 yL_7,plantout,plantin,line3,retbottle_
 - 8 yL_8,plantout,plantin,line3,retbottle_
 - 9 yL_9,plantout,plantin,line3,retbottle_
 - yR_0,plantout,plantin,line3,retbottle_
 - 2 yR_1,plantout,plantin,line3,retbottle_
 - 3 yR_2,plantout,plantin,line3,retbottle_
 - 4 yR_3,plantout,plantin,line3,retbottle_
 - 5 yR_4,plantout,plantin,line3,retbottle_
 - 6 yR_5,plantout,plantin,line3,retbottle_
 - 7 yR_6,plantout,plantin,line3,retbottle_
 - 8 yR_7,plantout,plantin,line3,retbottle_
 - 9 yR_8,plantout,plantin,line3,retbottle_
 - 10 yR_9,plantout,plantin,line3,retbottle_ = 0
_C41: f,plantout,plantin,line3,retbottle
 - 1.66028047329 yL_1,plantout,plantin,line3,retbottle_
 - 2.34799116268 yL_2,plantout,plantin,line3,retbottle_
 - 2.87569013456 yL_3,plantout,plantin,line3,retbottle_
 - 3.32056094659 yL_4,plantout,plantin,line3,retbottle_
 - 3.7125 yL_5,plantout,plantin,line3,retbottle_
 - 4.06683998948 yL_6,plantout,plantin,line3,retbottle_
 - 4.39268923895 yL_7,plantout,plantin,line3,retbottle_
 - 4.69598232535 yL_8,plantout,plantin,line3,retbottle_
 - 4.98084141988 yL_9,plantout,plantin,line3,retbottle_
 - 1.66028047329 yR_0,plantout,plantin,line3,retbottle_
 - 2.34799116268 yR_1,plantout,plantin,line3,retbottle_
 - 2.87569013456 yR_2,plantout,plantin,line3,retbottle_
 - 3.32056094659 yR_3,plantout,plantin,line3,retbottle_
 - 3.7125 yR_4,plantout,plantin,line3,retbottle_
 - 4.06683998948 yR_5,plantout,plantin,line3,retbottle_
 - 4.39268923895 yR_6,plantout,plantin,line3,retbottle_
 - 4.69598232535 yR_7,plantout,plantin,line3,retbottle_
 - 4.98084141988 yR_8,plantout,plantin,line3,retbottle_
 - 5.25026785031 yR_9,plantout,plantin,line3,retbottle_ = 0
_C42: yL_0,plantout,plantin,line3,retbottle_
 + yR_0,plantout,plantin,line3,retbottle_
 - z_0,plantout,plantin,line3,retbottle_ = 0
_C43: yL_1,plantout,plantin,line3,retbottle_
 + yR_1,plantout,plantin,line3,retbottle_
 - z_1,plantout,plantin,line3,retbottle_ = 0
_C44: yL_2,plantout,plantin,line3,retbottle_
 + yR_2,plantout,plantin,line3,retbottle_
 - z_2,plantout,plantin,line3,retbottle_ = 0
_C45: yL_3,plantout,plantin,line3,retbottle_
 + yR_3,plantout,plantin,line3,retbottle_
 - z_3,plantout,plantin,line3,retbottle_ = 0
_C46: yL_4,plantout,plantin,line3,retbottle_
 + yR_4,plantout,plantin,line3,retbottle_
 - z_4,plantout,plantin,line3,retbottle_ = 0
_C47: yL_5,plantout,plantin,line3,retbottle_
 + yR_5,plantout,plantin,line3,retbottle_
 - z_5,plantout,plantin,line3,retbottle_ = 0
_C48: yL_6,plantout,plantin,line3,retbottle_
 + yR_6,plantout,plantin,line3,retbottle_
 - z_6,plantout,plantin,line3,retbottle_ = 0
_C49: yL_7,plantout,plantin,line3,retbottle_
 + yR_7,plantout,plantin,line3,retbottle_
 - z_7,plantout,plantin,line3,retbottle_ = 0
_C5: yL_2,plantout,customer,vehicle,juice1_
 + yR_2,plantout,customer,vehicle,juice1_
 - z_2,plantout,customer,vehicle,juice1_ = 0
_C50: yL_8,plantout,plantin,line3,retbottle_
 + yR_8,plantout,plantin,line3,retbottle_
 - z_8,plantout,plantin,line3,retbottle_ = 0
_C51: yL_9,plantout,plantin,line3,retbottle_
 + yR_9,plantout,plantin,line3,retbottle_
 - z_9,plantout,plantin,line3,retbottle_ = 0
_C52: z_0,plantout,plantin,line3,retbottle_
 + z_1,plantout,plantin,line3,retbottle_
 + z_2,plantout,plantin,line3,retbottle_
 + z_3,plantout,plantin,line3,retbottle_
 + z_4,plantout,plantin,line3,retbottle_
 + z_5,plantout,plantin,line3,retbottle_
 + z_6,plantout,plantin,line3,retbottle_
 + z_7,plantout,plantin,line3,retbottle_
 + z_8,plantout,plantin,line3,retbottle_
 + z_9,plantout,plantin,line3,retbottle_ = 1
_C53: x,plantin,plantout,line1,juice2 - yL_1,plantin,plantout,line1,juice2_
 - 2 yL_2,plantin,plantout,line1,juice2_
 - 3 yL_3,plantin,plantout,line1,juice2_
 - 4 yL_4,plantin,plantout,line1,juice2_
 - 5 yL_5,plantin,plantout,line1,juice2_
 - 6 yL_6,plantin,plantout,line1,juice2_
 - 7 yL_7,plantin,plantout,line1,juice2_
 - 8 yL_8,plantin,plantout,line1,juice2_
 - 9 yL_9,plantin,plantout,line1,juice2_ - yR_0,plantin,plantout,line1,juice2_
 - 2 yR_1,plantin,plantout,line1,juice2_
 - 3 yR_2,plantin,plantout,line1,juice2_
 - 4 yR_3,plantin,plantout,line1,juice2_
 - 5 yR_4,plantin,plantout,line1,juice2_
 - 6 yR_5,plantin,plantout,line1,juice2_
 - 7 yR_6,plantin,plantout,line1,juice2_
 - 8 yR_7,plantin,plantout,line1,juice2_
 - 9 yR_8,plantin,plantout,line1,juice2_
 - 10 yR_9,plantin,plantout,line1,juice2_ = 0
_C54: f,plantin,plantout,line1,juice2
 - 22.8630706599 yL_1,plantin,plantout,line1,juice2_
 - 32.3332646047 yL_2,plantin,plantout,line1,juice2_
 - 39.6 yL_3,plantin,plantout,line1,juice2_
 - 45.7261413198 yL_4,plantin,plantout,line1,juice2_
 - 51.1233801699 yL_5,plantin,plantout,line1,juice2_
 - 56.00285707 yL_6,plantin,plantout,line1,juice2_
 - 60.4899991734 yL_7,plantin,plantout,line1,juice2_
 - 64.6665292095 yL_8,plantin,plantout,line1,juice2_
 - 68.5892119797 yL_9,plantin,plantout,line1,juice2_
 - 22.8630706599 yR_0,plantin,plantout,line1,juice2_
 - 32.3332646047 yR_1,plantin,plantout,line1,juice2_
 - 39.6 yR_2,plantin,plantout,line1,juice2_
 - 45.7261413198 yR_3,plantin,plantout,line1,juice2_
 - 51.1233801699 yR_4,plantin,plantout,line1,juice2_
 - 56.00285707 yR_5,plantin,plantout,line1,juice2_
 - 60.4899991734 yR_6,plantin,plantout,line1,juice2_
 - 64.6665292095 yR_7,plantin,plantout,line1,juice2_
 - 68.5892119797 yR_8,plantin,plantout,line1,juice2_
 - 72.2993775907 yR_9,plantin,plantout,line1,juice2_ = 0
_C55: yL_0,plantin,plantout,line1,juice2_
 + yR_0,plantin,plantout,line1,juice2_ - z_0,plantin,plantout,line1,juice2_
 = 0
_C56: yL_1,plantin,plantout,line1,juice2_
 + yR_1,plantin,plantout,line1,juice2_ - z_1,plantin,plantout,line1,juice2_
 = 0
_C57: yL_2,plantin,plantout,line1,juice2_
 + yR_2,plantin,plantout,line1,juice2_ - z_2,plantin,plantout,line1,juice2_
 = 0
_C58: yL_3,plantin,plantout,line1,juice2_
 + yR_3,plantin,plantout,line1,juice2_ - z_3,plantin,plantout,line1,juice2_
 = 0
_C59: yL_4,plantin,plantout,line1,juice2_
 + yR_4,plantin,plantout,line1,juice2_ - z_4,plantin,plantout,line1,juice2_
 = 0
_C6: yL_3,plantout,customer,vehicle,juice1_
 + yR_3,plantout,customer,vehicle,juice1_
 - z_3,plantout,customer,vehicle,juice1_ = 0
_C60: yL_5,plantin,plantout,line1,juice2_
 + yR_5,plantin,plantout,line1,juice2_ - z_5,plantin,plantout,line1,juice2_
 = 0
_C61: yL_6,plantin,plantout,line1,juice2_
 + yR_6,plantin,plantout,line1,juice2_ - z_6,plantin,plantout,line1,juice2_
 = 0
_C62: yL_7,plantin,plantout,line1,juice2_
 + yR_7,plantin,plantout,line1,juice2_ - z_7,plantin,plantout,line1,juice2_
 = 0
_C63: yL_8,plantin,plantout,line1,juice2_
 + yR_8,plantin,plantout,line1,juice2_ - z_8,plantin,plantout,line1,juice2_
 = 0
_C64: yL_9,plantin,plantout,line1,juice2_
 + yR_9,plantin,plantout,line1,juice2_ - z_9,plantin,plantout,line1,juice2_
 = 0
_C65: z_0,plantin,plantout,line1,juice2_ + z_1,plantin,plantout,line1,juice2_
 + z_2,plantin,plantout,line1,juice2_ + z_3,plantin,plantout,line1,juice2_
 + z_4,plantin,plantout,line1,juice2_ + z_5,plantin,plantout,line1,juice2_
 + z_6,plantin,plantout,line1,juice2_ + z_7,plantin,plantout,line1,juice2_
 + z_8,plantin,plantout,line1,juice2_ + z_9,plantin,plantout,line1,juice2_ = 1
_C66: x,plantin,plantout,line2,juice2 - yL_1,plantin,plantout,line2,juice2_
 - 2 yL_2,plantin,plantout,line2,juice2_
 - 3 yL_3,plantin,plantout,line2,juice2_
 - 4 yL_4,plantin,plantout,line2,juice2_
 - 5 yL_5,plantin,plantout,line2,juice2_
 - 6 yL_6,plantin,plantout,line2,juice2_
 - 7 yL_7,plantin,plantout,line2,juice2_
 - 8 yL_8,plantin,plantout,line2,juice2_
 - 9 yL_9,plantin,plantout,line2,juice2_ - yR_0,plantin,plantout,line2,juice2_
 - 2 yR_1,plantin,plantout,line2,juice2_
 - 3 yR_2,plantin,plantout,line2,juice2_
 - 4 yR_3,plantin,plantout,line2,juice2_
 - 5 yR_4,plantin,plantout,line2,juice2_
 - 6 yR_5,plantin,plantout,line2,juice2_
 - 7 yR_6,plantin,plantout,line2,juice2_
 - 8 yR_7,plantin,plantout,line2,juice2_
 - 9 yR_8,plantin,plantout,line2,juice2_
 - 10 yR_9,plantin,plantout,line2,juice2_ = 0
_C67: f,plantin,plantout,line2,juice2
 - 22.8630706599 yL_1,plantin,plantout,line2,juice2_
 - 32.3332646047 yL_2,plantin,plantout,line2,juice2_
 - 39.6 yL_3,plantin,plantout,line2,juice2_
 - 45.7261413198 yL_4,plantin,plantout,line2,juice2_
 - 51.1233801699 yL_5,plantin,plantout,line2,juice2_
 - 56.00285707 yL_6,plantin,plantout,line2,juice2_
 - 60.4899991734 yL_7,plantin,plantout,line2,juice2_
 - 64.6665292095 yL_8,plantin,plantout,line2,juice2_
 - 68.5892119797 yL_9,plantin,plantout,line2,juice2_
 - 22.8630706599 yR_0,plantin,plantout,line2,juice2_
 - 32.3332646047 yR_1,plantin,plantout,line2,juice2_
 - 39.6 yR_2,plantin,plantout,line2,juice2_
 - 45.7261413198 yR_3,plantin,plantout,line2,juice2_
 - 51.1233801699 yR_4,plantin,plantout,line2,juice2_
 - 56.00285707 yR_5,plantin,plantout,line2,juice2_
 - 60.4899991734 yR_6,plantin,plantout,line2,juice2_
 - 64.6665292095 yR_7,plantin,plantout,line2,juice2_
 - 68.5892119797 yR_8,plantin,plantout,line2,juice2_
 - 72.2993775907 yR_9,plantin,plantout,line2,juice2_ = 0
_C68: yL_0,plantin,plantout,line2,juice2_
 + yR_0,plantin,plantout,line2,juice2_ - z_0,plantin,plantout,line2,juice2_
 = 0
_C69: yL_1,plantin,plantout,line2,juice2_
 + yR_1,plantin,plantout,line2,juice2_ - z_1,plantin,plantout,line2,juice2_
 = 0
_C7: yL_4,plantout,customer,vehicle,juice1_
 + yR_4,plantout,customer,vehicle,juice1_
 - z_4,plantout,customer,vehicle,juice1_ = 0
_C70: yL_2,plantin,plantout,line2,juice2_
 + yR_2,plantin,plantout,line2,juice2_ - z_2,plantin,plantout,line2,juice2_
 = 0
_C71: yL_3,plantin,plantout,line2,juice2_
 + yR_3,plantin,plantout,line2,juice2_ - z_3,plantin,plantout,line2,juice2_
 = 0
_C72: yL_4,plantin,plantout,line2,juice2_
 + yR_4,plantin,plantout,line2,juice2_ - z_4,plantin,plantout,line2,juice2_
 = 0
_C73: yL_5,plantin,plantout,line2,juice2_
 + yR_5,plantin,plantout,line2,juice2_ - z_5,plantin,plantout,line2,juice2_
 = 0
_C74: yL_6,plantin,plantout,line2,juice2_
 + yR_6,plantin,plantout,line2,juice2_ - z_6,plantin,plantout,line2,juice2_
 = 0
_C75: yL_7,plantin,plantout,line2,juice2_
 + yR_7,plantin,plantout,line2,juice2_ - z_7,plantin,plantout,line2,juice2_
 = 0
_C76: yL_8,plantin,plantout,line2,juice2_
 + yR_8,plantin,plantout,line2,juice2_ - z_8,plantin,plantout,line2,juice2_
 = 0
_C77: yL_9,plantin,plantout,line2,juice2_
 + yR_9,plantin,plantout,line2,juice2_ - z_9,plantin,plantout,line2,juice2_
 = 0
_C78: z_0,plantin,plantout,line2,juice2_ + z_1,plantin,plantout,line2,juice2_
 + z_2,plantin,plantout,line2,juice2_ + z_3,plantin,plantout,line2,juice2_
 + z_4,plantin,plantout,line2,juice2_ + z_5,plantin,plantout,line2,juice2_
 + z_6,plantin,plantout,line2,juice2_ + z_7,plantin,plantout,line2,juice2_
 + z_8,plantin,plantout,line2,juice2_ + z_9,plantin,plantout,line2,juice2_ = 1
_C79: x,customer,plantout,vehicle,retbottle
 - yL_1,customer,plantout,vehicle,retbottle_
 - 2 yL_2,customer,plantout,vehicle,retbottle_
 - 3 yL_3,customer,plantout,vehicle,retbottle_
 - 4 yL_4,customer,plantout,vehicle,retbottle_
 - 5 yL_5,customer,plantout,vehicle,retbottle_
 - 6 yL_6,customer,plantout,vehicle,retbottle_
 - 7 yL_7,customer,plantout,vehicle,retbottle_
 - 8 yL_8,customer,plantout,vehicle,retbottle_
 - 9 yL_9,customer,plantout,vehicle,retbottle_
 - yR_0,customer,plantout,vehicle,retbottle_
 - 2 yR_1,customer,plantout,vehicle,retbottle_
 - 3 yR_2,customer,plantout,vehicle,retbottle_
 - 4 yR_3,customer,plantout,vehicle,retbottle_
 - 5 yR_4,customer,plantout,vehicle,retbottle_
 - 6 yR_5,customer,plantout,vehicle,retbottle_
 - 7 yR_6,customer,plantout,vehicle,retbottle_
 - 8 yR_7,customer,plantout,vehicle,retbottle_
 - 9 yR_8,customer,plantout,vehicle,retbottle_
 - 10 yR_9,customer,plantout,vehicle,retbottle_ = 0
_C8: yL_5,plantout,customer,vehicle,juice1_
 + yR_5,plantout,customer,vehicle,juice1_
 - z_5,plantout,customer,vehicle,juice1_ = 0
_C80: f,customer,plantout,vehicle,retbottle
 - 0.825 yL_1,customer,plantout,vehicle,retbottle_
 - 1.16672618896 yL_2,customer,plantout,vehicle,retbottle_
 - 1.42894191624 yL_3,customer,plantout,vehicle,retbottle_
 - 1.65 yL_4,customer,plantout,vehicle,retbottle_
 - 1.84475608144 yL_5,customer,plantout,vehicle,retbottle_
 - 2.0208290378 yL_6,customer,plantout,vehicle,retbottle_
 - 2.18274483163 yL_7,customer,plantout,vehicle,retbottle_
 - 2.33345237792 yL_8,customer,plantout,vehicle,retbottle_
 - 2.475 yL_9,customer,plantout,vehicle,retbottle_
 - 0.825 yR_0,customer,plantout,vehicle,retbottle_
 - 1.16672618896 yR_1,customer,plantout,vehicle,retbottle_
 - 1.42894191624 yR_2,customer,plantout,vehicle,retbottle_
 - 1.65 yR_3,customer,plantout,vehicle,retbottle_
 - 1.84475608144 yR_4,customer,plantout,vehicle,retbottle_
 - 2.0208290378 yR_5,customer,plantout,vehicle,retbottle_
 - 2.18274483163 yR_6,customer,plantout,vehicle,retbottle_
 - 2.33345237792 yR_7,customer,plantout,vehicle,retbottle_
 - 2.475 yR_8,customer,plantout,vehicle,retbottle_
 - 2.60887906964 yR_9,customer,plantout,vehicle,retbottle_ = 0
_C81: yL_0,customer,plantout,vehicle,retbottle_
 + yR_0,customer,plantout,vehicle,retbottle_
 - z_0,customer,plantout,vehicle,retbottle_ = 0
_C82: yL_1,customer,plantout,vehicle,retbottle_
 + yR_1,customer,plantout,vehicle,retbottle_
 - z_1,customer,plantout,vehicle,retbottle_ = 0
_C83: yL_2,customer,plantout,vehicle,retbottle_
 + yR_2,customer,plantout,vehicle,retbottle_
 - z_2,customer,plantout,vehicle,retbottle_ = 0
_C84: yL_3,customer,plantout,vehicle,retbottle_
 + yR_3,customer,plantout,vehicle,retbottle_
 - z_3,customer,plantout,vehicle,retbottle_ = 0
_C85: yL_4,customer,plantout,vehicle,retbottle_
 + yR_4,customer,plantout,vehicle,retbottle_
 - z_4,customer,plantout,vehicle,retbottle_ = 0
_C86: yL_5,customer,plantout,vehicle,retbottle_
 + yR_5,customer,plantout,vehicle,retbottle_
 - z_5,customer,plantout,vehicle,retbottle_ = 0
_C87: yL_6,customer,plantout,vehicle,retbottle_
 + yR_6,customer,plantout,vehicle,retbottle_
 - z_6,customer,plantout,vehicle,retbottle_ = 0
_C88: yL_7,customer,plantout,vehicle,retbottle_
 + yR_7,customer,plantout,vehicle,retbottle_
 - z_7,customer,plantout,vehicle,retbottle_ = 0
_C89: yL_8,customer,plantout,vehicle,retbottle_
 + yR_8,customer,plantout,vehicle,retbottle_
 - z_8,customer,plantout,vehicle,retbottle_ = 0
_C9: yL_6,plantout,customer,vehicle,juice1_
 + yR_6,plantout,customer,vehicle,juice1_
 - z_6,plantout,customer,vehicle,juice1_ = 0
_C90: yL_9,customer,plantout,vehicle,retbottle_
 + yR_9,customer,plantout,vehicle,retbottle_
 - z_9,customer,plantout,vehicle,retbottle_ = 0
_C91: z_0,customer,plantout,vehicle,retbottle_
 + z_1,customer,plantout,vehicle,retbottle_
 + z_2,customer,plantout,vehicle,retbottle_
 + z_3,customer,plantout,vehicle,retbottle_
 + z_4,customer,plantout,vehicle,retbottle_
 + z_5,customer,plantout,vehicle,retbottle_
 + z_6,customer,plantout,vehicle,retbottle_
 + z_7,customer,plantout,vehicle,retbottle_
 + z_8,customer,plantout,vehicle,retbottle_
 + z_9,customer,plantout,vehicle,retbottle_ = 1
_C92: x,plantin,plantout,line1,juice1 - yL_1,plantin,plantout,line1,juice1_
 - 2 yL_2,plantin,plantout,line1,juice1_
 - 3 yL_3,plantin,plantout,line1,juice1_
 - 4 yL_4,plantin,plantout,line1,juice1_
 - 5 yL_5,plantin,plantout,line1,juice1_
 - 6 yL_6,plantin,plantout,line1,juice1_
 - 7 yL_7,plantin,plantout,line1,juice1_
 - 8 yL_8,plantin,plantout,line1,juice1_
 - 9 yL_9,plantin,plantout,line1,juice1_ - yR_0,plantin,plantout,line1,juice1_
 - 2 yR_1,plantin,plantout,line1,juice1_
 - 3 yR_2,plantin,plantout,line1,juice1_
 - 4 yR_3,plantin,plantout,line1,juice1_
 - 5 yR_4,plantin,plantout,line1,juice1_
 - 6 yR_5,plantin,plantout,line1,juice1_
 - 7 yR_6,plantin,plantout,line1,juice1_
 - 8 yR_7,plantin,plantout,line1,juice1_
 - 9 yR_8,plantin,plantout,line1,juice1_
 - 10 yR_9,plantin,plantout,line1,juice1_ = 0
_C93: f,plantin,plantout,line1,juice1
 - 17.5008928344 yL_1,plantin,plantout,line1,juice1_
 - 24.75 yL_2,plantin,plantout,line1,juice1_
 - 30.3124355669 yL_3,plantin,plantout,line1,juice1_
 - 35.0017856687 yL_4,plantin,plantout,line1,juice1_
 - 39.1331860446 yL_5,plantin,plantout,line1,juice1_
 - 42.8682574873 yL_6,plantin,plantout,line1,juice1_
 - 46.3030101613 yL_7,plantin,plantout,line1,juice1_
 - 49.5 yL_8,plantin,plantout,line1,juice1_
 - 52.5026785031 yL_9,plantin,plantout,line1,juice1_
 - 17.5008928344 yR_0,plantin,plantout,line1,juice1_
 - 24.75 yR_1,plantin,plantout,line1,juice1_
 - 30.3124355669 yR_2,plantin,plantout,line1,juice1_
 - 35.0017856687 yR_3,plantin,plantout,line1,juice1_
 - 39.1331860446 yR_4,plantin,plantout,line1,juice1_
 - 42.8682574873 yR_5,plantin,plantout,line1,juice1_
 - 46.3030101613 yR_6,plantin,plantout,line1,juice1_
 - 49.5 yR_7,plantin,plantout,line1,juice1_
 - 52.5026785031 yR_8,plantin,plantout,line1,juice1_
 - 55.3426824431 yR_9,plantin,plantout,line1,juice1_ = 0
_C94: yL_0,plantin,plantout,line1,juice1_
 + yR_0,plantin,plantout,line1,juice1_ - z_0,plantin,plantout,line1,juice1_
 = 0
_C95: yL_1,plantin,plantout,line1,juice1_
 + yR_1,plantin,plantout,line1,juice1_ - z_1,plantin,plantout,line1,juice1_
 = 0
_C96: yL_2,plantin,plantout,line1,juice1_
 + yR_2,plantin,plantout,line1,juice1_ - z_2,plantin,plantout,line1,juice1_
 = 0
_C97: yL_3,plantin,plantout,line1,juice1_
 + yR_3,plantin,plantout,line1,juice1_ - z_3,plantin,plantout,line1,juice1_
 = 0
_C98: yL_4,plantin,plantout,line1,juice1_
 + yR_4,plantin,plantout,line1,juice1_ - z_4,plantin,plantout,line1,juice1_
 = 0
_C99: yL_5,plantin,plantout,line1,juice1_
 + yR_5,plantin,plantout,line1,juice1_ - z_5,plantin,plantout,line1,juice1_
 = 0
Bounds
f,customer,plantout,ship,retbottle free
f,customer,plantout,vehicle,retbottle free
f,plantin,plantout,line1,juice1 free
f,plantin,plantout,line1,juice2 free
f,plantin,plantout,line2,juice1 free
f,plantin,plantout,line2,juice2 free
f,plantin,sink,ship,glass free
f,plantout,customer,ship,juice1 free
f,plantout,customer,ship,juice2 free
f,plantout,customer,vehicle,juice1 free
f,plantout,customer,vehicle,juice2 free
f,plantout,plantin,line3,retbottle free
f,source1,plantin,vehicle,apple free
f,source1,plantin,vehicle,melon free
f,source2,plantin,ship,bottle free
0 <= x,customer,plantout,ship,retbottle <= 10
0 <= x,customer,plantout,vehicle,retbottle <= 10
0 <= x,plantin,plantout,line1,juice1 <= 10
0 <= x,plantin,plantout,line1,juice2 <= 10
0 <= x,plantin,plantout,line2,juice1 <= 10
0 <= x,plantin,plantout,line2,juice2 <= 10
0 <= x,plantin,sink,ship,glass <= 10
0 <= x,plantout,customer,ship,juice1 <= 10
0 <= x,plantout,customer,ship,juice2 <= 10
0 <= x,plantout,customer,vehicle,juice1 <= 10
0 <= x,plantout,customer,vehicle,juice2 <= 10
0 <= x,plantout,plantin,line3,retbottle <= 10
0 <= x,source1,plantin,vehicle,apple <= 50
0 <= x,source1,plantin,vehicle,melon <= 50
0 <= x,source2,plantin,ship,bottle <= 50
yL_0,customer,plantout,ship,retbottle_ <= 1
yL_0,customer,plantout,vehicle,retbottle_ <= 1
yL_0,plantin,plantout,line1,juice1_ <= 1
yL_0,plantin,plantout,line1,juice2_ <= 1
yL_0,plantin,plantout,line2,juice1_ <= 1
yL_0,plantin,plantout,line2,juice2_ <= 1
yL_0,plantin,sink,ship,glass_ <= 1
yL_0,plantout,customer,ship,juice1_ <= 1
yL_0,plantout,customer,ship,juice2_ <= 1
yL_0,plantout,customer,vehicle,juice1_ <= 1
yL_0,plantout,customer,vehicle,juice2_ <= 1
yL_0,plantout,plantin,line3,retbottle_ <= 1
yL_0,source1,plantin,vehicle,apple_ <= 1
yL_0,source1,plantin,vehicle,melon_ <= 1
yL_0,source2,plantin,ship,bottle_ <= 1
yL_1,customer,plantout,ship,retbottle_ <= 1
yL_1,customer,plantout,vehicle,retbottle_ <= 1
yL_1,plantin,plantout,line1,juice1_ <= 1
yL_1,plantin,plantout,line1,juice2_ <= 1
yL_1,plantin,plantout,line2,juice1_ <= 1
yL_1,plantin,plantout,line2,juice2_ <= 1
yL_1,plantin,sink,ship,glass_ <= 1
yL_1,plantout,customer,ship,juice1_ <= 1
yL_1,plantout,customer,ship,juice2_ <= 1
yL_1,plantout,customer,vehicle,juice1_ <= 1
yL_1,plantout,customer,vehicle,juice2_ <= 1
yL_1,plantout,plantin,line3,retbottle_ <= 1
yL_1,source1,plantin,vehicle,apple_ <= 1
yL_1,source1,plantin,vehicle,melon_ <= 1
yL_1,source2,plantin,ship,bottle_ <= 1
yL_10,source1,plantin,vehicle,apple_ <= 1
yL_10,source1,plantin,vehicle,melon_ <= 1
yL_10,source2,plantin,ship,bottle_ <= 1
yL_11,source1,plantin,vehicle,apple_ <= 1
yL_11,source1,plantin,vehicle,melon_ <= 1
yL_11,source2,plantin,ship,bottle_ <= 1
yL_12,source1,plantin,vehicle,apple_ <= 1
yL_12,source1,plantin,vehicle,melon_ <= 1
yL_12,source2,plantin,ship,bottle_ <= 1
yL_13,source1,plantin,vehicle,apple_ <= 1
yL_13,source1,plantin,vehicle,melon_ <= 1
yL_13,source2,plantin,ship,bottle_ <= 1
yL_14,source1,plantin,vehicle,apple_ <= 1
yL_14,source1,plantin,vehicle,melon_ <= 1
yL_14,source2,plantin,ship,bottle_ <= 1
yL_15,source1,plantin,vehicle,apple_ <= 1
yL_15,source1,plantin,vehicle,melon_ <= 1
yL_15,source2,plantin,ship,bottle_ <= 1
yL_16,source1,plantin,vehicle,apple_ <= 1
yL_16,source1,plantin,vehicle,melon_ <= 1
yL_16,source2,plantin,ship,bottle_ <= 1
yL_17,source1,plantin,vehicle,apple_ <= 1
yL_17,source1,plantin,vehicle,melon_ <= 1
yL_17,source2,plantin,ship,bottle_ <= 1
yL_18,source1,plantin,vehicle,apple_ <= 1
yL_18,source1,plantin,vehicle,melon_ <= 1
yL_18,source2,plantin,ship,bottle_ <= 1
yL_19,source1,plantin,vehicle,apple_ <= 1
yL_19,source1,plantin,vehicle,melon_ <= 1
yL_19,source2,plantin,ship,bottle_ <= 1
yL_2,customer,plantout,ship,retbottle_ <= 1
yL_2,customer,plantout,vehicle,retbottle_ <= 1
yL_2,plantin,plantout,line1,juice1_ <= 1
yL_2,plantin,plantout,line1,juice2_ <= 1
yL_2,plantin,plantout,line2,juice1_ <= 1
yL_2,plantin,plantout,line2,juice2_ <= 1
yL_2,plantin,sink,ship,glass_ <= 1
yL_2,plantout,customer,ship,juice1_ <= 1
yL_2,plantout,customer,ship,juice2_ <= 1
yL_2,plantout,customer,vehicle,juice1_ <= 1
yL_2,plantout,customer,vehicle,juice2_ <= 1
yL_2,plantout,plantin,line3,retbottle_ <= 1
yL_2,source1,plantin,vehicle,apple_ <= 1
yL_2,source1,plantin,vehicle,melon_ <= 1
yL_2,source2,plantin,ship,bottle_ <= 1
yL_20,source1,plantin,vehicle,apple_ <= 1
yL_20,source1,plantin,vehicle,melon_ <= 1
yL_20,source2,plantin,ship,bottle_ <= 1
yL_21,source1,plantin,vehicle,apple_ <= 1
yL_21,source1,plantin,vehicle,melon_ <= 1
yL_21,source2,plantin,ship,bottle_ <= 1
yL_22,source1,plantin,vehicle,apple_ <= 1
yL_22,source1,plantin,vehicle,melon_ <= 1
yL_22,source2,plantin,ship,bottle_ <= 1
yL_23,source1,plantin,vehicle,apple_ <= 1
yL_23,source1,plantin,vehicle,melon_ <= 1
yL_23,source2,plantin,ship,bottle_ <= 1
yL_24,source1,plantin,vehicle,apple_ <= 1
yL_24,source1,plantin,vehicle,melon_ <= 1
yL_24,source2,plantin,ship,bottle_ <= 1
yL_25,source1,plantin,vehicle,apple_ <= 1
yL_25,source1,plantin,vehicle,melon_ <= 1
yL_25,source2,plantin,ship,bottle_ <= 1
yL_26,source1,plantin,vehicle,apple_ <= 1
yL_26,source1,plantin,vehicle,melon_ <= 1
yL_26,source2,plantin,ship,bottle_ <= 1
yL_27,source1,plantin,vehicle,apple_ <= 1
yL_27,source1,plantin,vehicle,melon_ <= 1
yL_27,source2,plantin,ship,bottle_ <= 1
yL_28,source1,plantin,vehicle,apple_ <= 1
yL_28,source1,plantin,vehicle,melon_ <= 1
yL_28,source2,plantin,ship,bottle_ <= 1
yL_29,source1,plantin,vehicle,apple_ <= 1
yL_29,source1,plantin,vehicle,melon_ <= 1
yL_29,source2,plantin,ship,bottle_ <= 1
yL_3,customer,plantout,ship,retbottle_ <= 1
yL_3,customer,plantout,vehicle,retbottle_ <= 1
yL_3,plantin,plantout,line1,juice1_ <= 1
yL_3,plantin,plantout,line1,juice2_ <= 1
yL_3,plantin,plantout,line2,juice1_ <= 1
yL_3,plantin,plantout,line2,juice2_ <= 1
yL_3,plantin,sink,ship,glass_ <= 1
yL_3,plantout,customer,ship,juice1_ <= 1
yL_3,plantout,customer,ship,juice2_ <= 1
yL_3,plantout,customer,vehicle,juice1_ <= 1
yL_3,plantout,customer,vehicle,juice2_ <= 1
yL_3,plantout,plantin,line3,retbottle_ <= 1
yL_3,source1,plantin,vehicle,apple_ <= 1
yL_3,source1,plantin,vehicle,melon_ <= 1
yL_3,source2,plantin,ship,bottle_ <= 1
yL_30,source1,plantin,vehicle,apple_ <= 1
yL_30,source1,plantin,vehicle,melon_ <= 1
yL_30,source2,plantin,ship,bottle_ <= 1
yL_31,source1,plantin,vehicle,apple_ <= 1
yL_31,source1,plantin,vehicle,melon_ <= 1
yL_31,source2,plantin,ship,bottle_ <= 1
yL_32,source1,plantin,vehicle,apple_ <= 1
yL_32,source1,plantin,vehicle,melon_ <= 1
yL_32,source2,plantin,ship,bottle_ <= 1
yL_33,source1,plantin,vehicle,apple_ <= 1
yL_33,source1,plantin,vehicle,melon_ <= 1
yL_33,source2,plantin,ship,bottle_ <= 1
yL_34,source1,plantin,vehicle,apple_ <= 1
yL_34,source1,plantin,vehicle,melon_ <= 1
yL_34,source2,plantin,ship,bottle_ <= 1
yL_35,source1,plantin,vehicle,apple_ <= 1
yL_35,source1,plantin,vehicle,melon_ <= 1
yL_35,source2,plantin,ship,bottle_ <= 1
yL_36,source1,plantin,vehicle,apple_ <= 1
yL_36,source1,plantin,vehicle,melon_ <= 1
yL_36,source2,plantin,ship,bottle_ <= 1
yL_37,source1,plantin,vehicle,apple_ <= 1
yL_37,source1,plantin,vehicle,melon_ <= 1
yL_37,source2,plantin,ship,bottle_ <= 1
yL_38,source1,plantin,vehicle,apple_ <= 1
yL_38,source1,plantin,vehicle,melon_ <= 1
yL_38,source2,plantin,ship,bottle_ <= 1
yL_39,source1,plantin,vehicle,apple_ <= 1
yL_39,source1,plantin,vehicle,melon_ <= 1
yL_39,source2,plantin,ship,bottle_ <= 1
yL_4,customer,plantout,ship,retbottle_ <= 1
yL_4,customer,plantout,vehicle,retbottle_ <= 1
yL_4,plantin,plantout,line1,juice1_ <= 1
yL_4,plantin,plantout,line1,juice2_ <= 1
yL_4,plantin,plantout,line2,juice1_ <= 1
yL_4,plantin,plantout,line2,juice2_ <= 1
yL_4,plantin,sink,ship,glass_ <= 1
yL_4,plantout,customer,ship,juice1_ <= 1
yL_4,plantout,customer,ship,juice2_ <= 1
yL_4,plantout,customer,vehicle,juice1_ <= 1
yL_4,plantout,customer,vehicle,juice2_ <= 1
yL_4,plantout,plantin,line3,retbottle_ <= 1
yL_4,source1,plantin,vehicle,apple_ <= 1
yL_4,source1,plantin,vehicle,melon_ <= 1
yL_4,source2,plantin,ship,bottle_ <= 1
yL_40,source1,plantin,vehicle,apple_ <= 1
yL_40,source1,plantin,vehicle,melon_ <= 1
yL_40,source2,plantin,ship,bottle_ <= 1
yL_41,source1,plantin,vehicle,apple_ <= 1
yL_41,source1,plantin,vehicle,melon_ <= 1
yL_41,source2,plantin,ship,bottle_ <= 1
yL_42,source1,plantin,vehicle,apple_ <= 1
yL_42,source1,plantin,vehicle,melon_ <= 1
yL_42,source2,plantin,ship,bottle_ <= 1
yL_43,source1,plantin,vehicle,apple_ <= 1
yL_43,source1,plantin,vehicle,melon_ <= 1
yL_43,source2,plantin,ship,bottle_ <= 1
yL_44,source1,plantin,vehicle,apple_ <= 1
yL_44,source1,plantin,vehicle,melon_ <= 1
yL_44,source2,plantin,ship,bottle_ <= 1
yL_45,source1,plantin,vehicle,apple_ <= 1
yL_45,source1,plantin,vehicle,melon_ <= 1
yL_45,source2,plantin,ship,bottle_ <= 1
yL_46,source1,plantin,vehicle,apple_ <= 1
yL_46,source1,plantin,vehicle,melon_ <= 1
yL_46,source2,plantin,ship,bottle_ <= 1
yL_47,source1,plantin,vehicle,apple_ <= 1
yL_47,source1,plantin,vehicle,melon_ <= 1
yL_47,source2,plantin,ship,bottle_ <= 1
yL_48,source1,plantin,vehicle,apple_ <= 1
yL_48,source1,plantin,vehicle,melon_ <= 1
yL_48,source2,plantin,ship,bottle_ <= 1
yL_49,source1,plantin,vehicle,apple_ <= 1
yL_49,source1,plantin,vehicle,melon_ <= 1
yL_49,source2,plantin,ship,bottle_ <= 1
yL_5,customer,plantout,ship,retbottle_ <= 1
yL_5,customer,plantout,vehicle,retbottle_ <= 1
yL_5,plantin,plantout,line1,juice1_ <= 1
yL_5,plantin,plantout,line1,juice2_ <= 1
yL_5,plantin,plantout,line2,juice1_ <= 1
yL_5,plantin,plantout,line2,juice2_ <= 1
yL_5,plantin,sink,ship,glass_ <= 1
yL_5,plantout,customer,ship,juice1_ <= 1
yL_5,plantout,customer,ship,juice2_ <= 1
yL_5,plantout,customer,vehicle,juice1_ <= 1
yL_5,plantout,customer,vehicle,juice2_ <= 1
yL_5,plantout,plantin,line3,retbottle_ <= 1
yL_5,source1,plantin,vehicle,apple_ <= 1
yL_5,source1,plantin,vehicle,melon_ <= 1
yL_5,source2,plantin,ship,bottle_ <= 1
yL_6,customer,plantout,ship,retbottle_ <= 1
yL_6,customer,plantout,vehicle,retbottle_ <= 1
yL_6,plantin,plantout,line1,juice1_ <= 1
yL_6,plantin,plantout,line1,juice2_ <= 1
yL_6,plantin,plantout,line2,juice1_ <= 1
yL_6,plantin,plantout,line2,juice2_ <= 1
yL_6,plantin,sink,ship,glass_ <= 1
yL_6,plantout,customer,ship,juice1_ <= 1
yL_6,plantout,customer,ship,juice2_ <= 1
yL_6,plantout,customer,vehicle,juice1_ <= 1
yL_6,plantout,customer,vehicle,juice2_ <= 1
yL_6,plantout,plantin,line3,retbottle_ <= 1
yL_6,source1,plantin,vehicle,apple_ <= 1
yL_6,source1,plantin,vehicle,melon_ <= 1
yL_6,source2,plantin,ship,bottle_ <= 1
yL_7,customer,plantout,ship,retbottle_ <= 1
yL_7,customer,plantout,vehicle,retbottle_ <= 1
yL_7,plantin,plantout,line1,juice1_ <= 1
yL_7,plantin,plantout,line1,juice2_ <= 1
yL_7,plantin,plantout,line2,juice1_ <= 1
yL_7,plantin,plantout,line2,juice2_ <= 1
yL_7,plantin,sink,ship,glass_ <= 1
yL_7,plantout,customer,ship,juice1_ <= 1
yL_7,plantout,customer,ship,juice2_ <= 1
yL_7,plantout,customer,vehicle,juice1_ <= 1
yL_7,plantout,customer,vehicle,juice2_ <= 1
yL_7,plantout,plantin,line3,retbottle_ <= 1
yL_7,source1,plantin,vehicle,apple_ <= 1
yL_7,source1,plantin,vehicle,melon_ <= 1
yL_7,source2,plantin,ship,bottle_ <= 1
yL_8,customer,plantout,ship,retbottle_ <= 1
yL_8,customer,plantout,vehicle,retbottle_ <= 1
yL_8,plantin,plantout,line1,juice1_ <= 1
yL_8,plantin,plantout,line1,juice2_ <= 1
yL_8,plantin,plantout,line2,juice1_ <= 1
yL_8,plantin,plantout,line2,juice2_ <= 1
yL_8,plantin,sink,ship,glass_ <= 1
yL_8,plantout,customer,ship,juice1_ <= 1
yL_8,plantout,customer,ship,juice2_ <= 1
yL_8,plantout,customer,vehicle,juice1_ <= 1
yL_8,plantout,customer,vehicle,juice2_ <= 1
yL_8,plantout,plantin,line3,retbottle_ <= 1
yL_8,source1,plantin,vehicle,apple_ <= 1
yL_8,source1,plantin,vehicle,melon_ <= 1
yL_8,source2,plantin,ship,bottle_ <= 1
yL_9,customer,plantout,ship,retbottle_ <= 1
yL_9,customer,plantout,vehicle,retbottle_ <= 1
yL_9,plantin,plantout,line1,juice1_ <= 1
yL_9,plantin,plantout,line1,juice2_ <= 1
yL_9,plantin,plantout,line2,juice1_ <= 1
yL_9,plantin,plantout,line2,juice2_ <= 1
yL_9,plantin,sink,ship,glass_ <= 1
yL_9,plantout,customer,ship,juice1_ <= 1
yL_9,plantout,customer,ship,juice2_ <= 1
yL_9,plantout,customer,vehicle,juice1_ <= 1
yL_9,plantout,customer,vehicle,juice2_ <= 1
yL_9,plantout,plantin,line3,retbottle_ <= 1
yL_9,source1,plantin,vehicle,apple_ <= 1
yL_9,source1,plantin,vehicle,melon_ <= 1
yL_9,source2,plantin,ship,bottle_ <= 1
yR_0,customer,plantout,ship,retbottle_ <= 1
yR_0,customer,plantout,vehicle,retbottle_ <= 1
yR_0,plantin,plantout,line1,juice1_ <= 1
yR_0,plantin,plantout,line1,juice2_ <= 1
yR_0,plantin,plantout,line2,juice1_ <= 1
yR_0,plantin,plantout,line2,juice2_ <= 1
yR_0,plantin,sink,ship,glass_ <= 1
yR_0,plantout,customer,ship,juice1_ <= 1
yR_0,plantout,customer,ship,juice2_ <= 1
yR_0,plantout,customer,vehicle,juice1_ <= 1
yR_0,plantout,customer,vehicle,juice2_ <= 1
yR_0,plantout,plantin,line3,retbottle_ <= 1
yR_0,source1,plantin,vehicle,apple_ <= 1
yR_0,source1,plantin,vehicle,melon_ <= 1
yR_0,source2,plantin,ship,bottle_ <= 1
yR_1,customer,plantout,ship,retbottle_ <= 1
yR_1,customer,plantout,vehicle,retbottle_ <= 1
yR_1,plantin,plantout,line1,juice1_ <= 1
yR_1,plantin,plantout,line1,juice2_ <= 1
yR_1,plantin,plantout,line2,juice1_ <= 1
yR_1,plantin,plantout,line2,juice2_ <= 1
yR_1,plantin,sink,ship,glass_ <= 1
yR_1,plantout,customer,ship,juice1_ <= 1
yR_1,plantout,customer,ship,juice2_ <= 1
yR_1,plantout,customer,vehicle,juice1_ <= 1
yR_1,plantout,customer,vehicle,juice2_ <= 1
yR_1,plantout,plantin,line3,retbottle_ <= 1
yR_1,source1,plantin,vehicle,apple_ <= 1
yR_1,source1,plantin,vehicle,melon_ <= 1
yR_1,source2,plantin,ship,bottle_ <= 1
yR_10,source1,plantin,vehicle,apple_ <= 1
yR_10,source1,plantin,vehicle,melon_ <= 1
yR_10,source2,plantin,ship,bottle_ <= 1
yR_11,source1,plantin,vehicle,apple_ <= 1
yR_11,source1,plantin,vehicle,melon_ <= 1
yR_11,source2,plantin,ship,bottle_ <= 1
yR_12,source1,plantin,vehicle,apple_ <= 1
yR_12,source1,plantin,vehicle,melon_ <= 1
yR_12,source2,plantin,ship,bottle_ <= 1
yR_13,source1,plantin,vehicle,apple_ <= 1
yR_13,source1,plantin,vehicle,melon_ <= 1
yR_13,source2,plantin,ship,bottle_ <= 1
yR_14,source1,plantin,vehicle,apple_ <= 1
yR_14,source1,plantin,vehicle,melon_ <= 1
yR_14,source2,plantin,ship,bottle_ <= 1
yR_15,source1,plantin,vehicle,apple_ <= 1
yR_15,source1,plantin,vehicle,melon_ <= 1
yR_15,source2,plantin,ship,bottle_ <= 1
yR_16,source1,plantin,vehicle,apple_ <= 1
yR_16,source1,plantin,vehicle,melon_ <= 1
yR_16,source2,plantin,ship,bottle_ <= 1
yR_17,source1,plantin,vehicle,apple_ <= 1
yR_17,source1,plantin,vehicle,melon_ <= 1
yR_17,source2,plantin,ship,bottle_ <= 1
yR_18,source1,plantin,vehicle,apple_ <= 1
yR_18,source1,plantin,vehicle,melon_ <= 1
yR_18,source2,plantin,ship,bottle_ <= 1
yR_19,source1,plantin,vehicle,apple_ <= 1
yR_19,source1,plantin,vehicle,melon_ <= 1
yR_19,source2,plantin,ship,bottle_ <= 1
yR_2,customer,plantout,ship,retbottle_ <= 1
yR_2,customer,plantout,vehicle,retbottle_ <= 1
yR_2,plantin,plantout,line1,juice1_ <= 1
yR_2,plantin,plantout,line1,juice2_ <= 1
yR_2,plantin,plantout,line2,juice1_ <= 1
yR_2,plantin,plantout,line2,juice2_ <= 1
yR_2,plantin,sink,ship,glass_ <= 1
yR_2,plantout,customer,ship,juice1_ <= 1
yR_2,plantout,customer,ship,juice2_ <= 1
yR_2,plantout,customer,vehicle,juice1_ <= 1
yR_2,plantout,customer,vehicle,juice2_ <= 1
yR_2,plantout,plantin,line3,retbottle_ <= 1
yR_2,source1,plantin,vehicle,apple_ <= 1
yR_2,source1,plantin,vehicle,melon_ <= 1
yR_2,source2,plantin,ship,bottle_ <= 1
yR_20,source1,plantin,vehicle,apple_ <= 1
yR_20,source1,plantin,vehicle,melon_ <= 1
yR_20,source2,plantin,ship,bottle_ <= 1
yR_21,source1,plantin,vehicle,apple_ <= 1
yR_21,source1,plantin,vehicle,melon_ <= 1
yR_21,source2,plantin,ship,bottle_ <= 1
yR_22,source1,plantin,vehicle,apple_ <= 1
yR_22,source1,plantin,vehicle,melon_ <= 1
yR_22,source2,plantin,ship,bottle_ <= 1
yR_23,source1,plantin,vehicle,apple_ <= 1
yR_23,source1,plantin,vehicle,melon_ <= 1
yR_23,source2,plantin,ship,bottle_ <= 1
yR_24,source1,plantin,vehicle,apple_ <= 1
yR_24,source1,plantin,vehicle,melon_ <= 1
yR_24,source2,plantin,ship,bottle_ <= 1
yR_25,source1,plantin,vehicle,apple_ <= 1
yR_25,source1,plantin,vehicle,melon_ <= 1
yR_25,source2,plantin,ship,bottle_ <= 1
yR_26,source1,plantin,vehicle,apple_ <= 1
yR_26,source1,plantin,vehicle,melon_ <= 1
yR_26,source2,plantin,ship,bottle_ <= 1
yR_27,source1,plantin,vehicle,apple_ <= 1
yR_27,source1,plantin,vehicle,melon_ <= 1
yR_27,source2,plantin,ship,bottle_ <= 1
yR_28,source1,plantin,vehicle,apple_ <= 1
yR_28,source1,plantin,vehicle,melon_ <= 1
yR_28,source2,plantin,ship,bottle_ <= 1
yR_29,source1,plantin,vehicle,apple_ <= 1
yR_29,source1,plantin,vehicle,melon_ <= 1
yR_29,source2,plantin,ship,bottle_ <= 1
yR_3,customer,plantout,ship,retbottle_ <= 1
yR_3,customer,plantout,vehicle,retbottle_ <= 1
yR_3,plantin,plantout,line1,juice1_ <= 1
yR_3,plantin,plantout,line1,juice2_ <= 1
yR_3,plantin,plantout,line2,juice1_ <= 1
yR_3,plantin,plantout,line2,juice2_ <= 1
yR_3,plantin,sink,ship,glass_ <= 1
yR_3,plantout,customer,ship,juice1_ <= 1
yR_3,plantout,customer,ship,juice2_ <= 1
yR_3,plantout,customer,vehicle,juice1_ <= 1
yR_3,plantout,customer,vehicle,juice2_ <= 1
yR_3,plantout,plantin,line3,retbottle_ <= 1
yR_3,source1,plantin,vehicle,apple_ <= 1
yR_3,source1,plantin,vehicle,melon_ <= 1
yR_3,source2,plantin,ship,bottle_ <= 1
yR_30,source1,plantin,vehicle,apple_ <= 1
yR_30,source1,plantin,vehicle,melon_ <= 1
yR_30,source2,plantin,ship,bottle_ <= 1
yR_31,source1,plantin,vehicle,apple_ <= 1
yR_31,source1,plantin,vehicle,melon_ <= 1
yR_31,source2,plantin,ship,bottle_ <= 1
yR_32,source1,plantin,vehicle,apple_ <= 1
yR_32,source1,plantin,vehicle,melon_ <= 1
yR_32,source2,plantin,ship,bottle_ <= 1
yR_33,source1,plantin,vehicle,apple_ <= 1
yR_33,source1,plantin,vehicle,melon_ <= 1
yR_33,source2,plantin,ship,bottle_ <= 1
yR_34,source1,plantin,vehicle,apple_ <= 1
yR_34,source1,plantin,vehicle,melon_ <= 1
yR_34,source2,plantin,ship,bottle_ <= 1
yR_35,source1,plantin,vehicle,apple_ <= 1
yR_35,source1,plantin,vehicle,melon_ <= 1
yR_35,source2,plantin,ship,bottle_ <= 1
yR_36,source1,plantin,vehicle,apple_ <= 1
yR_36,source1,plantin,vehicle,melon_ <= 1
yR_36,source2,plantin,ship,bottle_ <= 1
yR_37,source1,plantin,vehicle,apple_ <= 1
yR_37,source1,plantin,vehicle,melon_ <= 1
yR_37,source2,plantin,ship,bottle_ <= 1
yR_38,source1,plantin,vehicle,apple_ <= 1
yR_38,source1,plantin,vehicle,melon_ <= 1
yR_38,source2,plantin,ship,bottle_ <= 1
yR_39,source1,plantin,vehicle,apple_ <= 1
yR_39,source1,plantin,vehicle,melon_ <= 1
yR_39,source2,plantin,ship,bottle_ <= 1
yR_4,customer,plantout,ship,retbottle_ <= 1
yR_4,customer,plantout,vehicle,retbottle_ <= 1
yR_4,plantin,plantout,line1,juice1_ <= 1
yR_4,plantin,plantout,line1,juice2_ <= 1
yR_4,plantin,plantout,line2,juice1_ <= 1
yR_4,plantin,plantout,line2,juice2_ <= 1
yR_4,plantin,sink,ship,glass_ <= 1
yR_4,plantout,customer,ship,juice1_ <= 1
yR_4,plantout,customer,ship,juice2_ <= 1
yR_4,plantout,customer,vehicle,juice1_ <= 1
yR_4,plantout,customer,vehicle,juice2_ <= 1
yR_4,plantout,plantin,line3,retbottle_ <= 1
yR_4,source1,plantin,vehicle,apple_ <= 1
yR_4,source1,plantin,vehicle,melon_ <= 1
yR_4,source2,plantin,ship,bottle_ <= 1
yR_40,source1,plantin,vehicle,apple_ <= 1
yR_40,source1,plantin,vehicle,melon_ <= 1
yR_40,source2,plantin,ship,bottle_ <= 1
yR_41,source1,plantin,vehicle,apple_ <= 1
yR_41,source1,plantin,vehicle,melon_ <= 1
yR_41,source2,plantin,ship,bottle_ <= 1
yR_42,source1,plantin,vehicle,apple_ <= 1
yR_42,source1,plantin,vehicle,melon_ <= 1
yR_42,source2,plantin,ship,bottle_ <= 1
yR_43,source1,plantin,vehicle,apple_ <= 1
yR_43,source1,plantin,vehicle,melon_ <= 1
yR_43,source2,plantin,ship,bottle_ <= 1
yR_44,source1,plantin,vehicle,apple_ <= 1
yR_44,source1,plantin,vehicle,melon_ <= 1
yR_44,source2,plantin,ship,bottle_ <= 1
yR_45,source1,plantin,vehicle,apple_ <= 1
yR_45,source1,plantin,vehicle,melon_ <= 1
yR_45,source2,plantin,ship,bottle_ <= 1
yR_46,source1,plantin,vehicle,apple_ <= 1
yR_46,source1,plantin,vehicle,melon_ <= 1
yR_46,source2,plantin,ship,bottle_ <= 1
yR_47,source1,plantin,vehicle,apple_ <= 1
yR_47,source1,plantin,vehicle,melon_ <= 1
yR_47,source2,plantin,ship,bottle_ <= 1
yR_48,source1,plantin,vehicle,apple_ <= 1
yR_48,source1,plantin,vehicle,melon_ <= 1
yR_48,source2,plantin,ship,bottle_ <= 1
yR_49,source1,plantin,vehicle,apple_ <= 1
yR_49,source1,plantin,vehicle,melon_ <= 1
yR_49,source2,plantin,ship,bottle_ <= 1
yR_5,customer,plantout,ship,retbottle_ <= 1
yR_5,customer,plantout,vehicle,retbottle_ <= 1
yR_5,plantin,plantout,line1,juice1_ <= 1
yR_5,plantin,plantout,line1,juice2_ <= 1
yR_5,plantin,plantout,line2,juice1_ <= 1
yR_5,plantin,plantout,line2,juice2_ <= 1
yR_5,plantin,sink,ship,glass_ <= 1
yR_5,plantout,customer,ship,juice1_ <= 1
yR_5,plantout,customer,ship,juice2_ <= 1
yR_5,plantout,customer,vehicle,juice1_ <= 1
yR_5,plantout,customer,vehicle,juice2_ <= 1
yR_5,plantout,plantin,line3,retbottle_ <= 1
yR_5,source1,plantin,vehicle,apple_ <= 1
yR_5,source1,plantin,vehicle,melon_ <= 1
yR_5,source2,plantin,ship,bottle_ <= 1
yR_6,customer,plantout,ship,retbottle_ <= 1
yR_6,customer,plantout,vehicle,retbottle_ <= 1
yR_6,plantin,plantout,line1,juice1_ <= 1
yR_6,plantin,plantout,line1,juice2_ <= 1
yR_6,plantin,plantout,line2,juice1_ <= 1
yR_6,plantin,plantout,line2,juice2_ <= 1
yR_6,plantin,sink,ship,glass_ <= 1
yR_6,plantout,customer,ship,juice1_ <= 1
yR_6,plantout,customer,ship,juice2_ <= 1
yR_6,plantout,customer,vehicle,juice1_ <= 1
yR_6,plantout,customer,vehicle,juice2_ <= 1
yR_6,plantout,plantin,line3,retbottle_ <= 1
yR_6,source1,plantin,vehicle,apple_ <= 1
yR_6,source1,plantin,vehicle,melon_ <= 1
yR_6,source2,plantin,ship,bottle_ <= 1
yR_7,customer,plantout,ship,retbottle_ <= 1
yR_7,customer,plantout,vehicle,retbottle_ <= 1
yR_7,plantin,plantout,line1,juice1_ <= 1
yR_7,plantin,plantout,line1,juice2_ <= 1
yR_7,plantin,plantout,line2,juice1_ <= 1
yR_7,plantin,plantout,line2,juice2_ <= 1
yR_7,plantin,sink,ship,glass_ <= 1
yR_7,plantout,customer,ship,juice1_ <= 1
yR_7,plantout,customer,ship,juice2_ <= 1
yR_7,plantout,customer,vehicle,juice1_ <= 1
yR_7,plantout,customer,vehicle,juice2_ <= 1
yR_7,plantout,plantin,line3,retbottle_ <= 1
yR_7,source1,plantin,vehicle,apple_ <= 1
yR_7,source1,plantin,vehicle,melon_ <= 1
yR_7,source2,plantin,ship,bottle_ <= 1
yR_8,customer,plantout,ship,retbottle_ <= 1
yR_8,customer,plantout,vehicle,retbottle_ <= 1
yR_8,plantin,plantout,line1,juice1_ <= 1
yR_8,plantin,plantout,line1,juice2_ <= 1
yR_8,plantin,plantout,line2,juice1_ <= 1
yR_8,plantin,plantout,line2,juice2_ <= 1
yR_8,plantin,sink,ship,glass_ <= 1
yR_8,plantout,customer,ship,juice1_ <= 1
yR_8,plantout,customer,ship,juice2_ <= 1
yR_8,plantout,customer,vehicle,juice1_ <= 1
yR_8,plantout,customer,vehicle,juice2_ <= 1
yR_8,plantout,plantin,line3,retbottle_ <= 1
yR_8,source1,plantin,vehicle,apple_ <= 1
yR_8,source1,plantin,vehicle,melon_ <= 1
yR_8,source2,plantin,ship,bottle_ <= 1
yR_9,customer,plantout,ship,retbottle_ <= 1
yR_9,customer,plantout,vehicle,retbottle_ <= 1
yR_9,plantin,plantout,line1,juice1_ <= 1
yR_9,plantin,plantout,line1,juice2_ <= 1
yR_9,plantin,plantout,line2,juice1_ <= 1
yR_9,plantin,plantout,line2,juice2_ <= 1
yR_9,plantin,sink,ship,glass_ <= 1
yR_9,plantout,customer,ship,juice1_ <= 1
yR_9,plantout,customer,ship,juice2_ <= 1
yR_9,plantout,customer,vehicle,juice1_ <= 1
yR_9,plantout,customer,vehicle,juice2_ <= 1
yR_9,plantout,plantin,line3,retbottle_ <= 1
yR_9,source1,plantin,vehicle,apple_ <= 1
yR_9,source1,plantin,vehicle,melon_ <= 1
yR_9,source2,plantin,ship,bottle_ <= 1
Binaries
y(customer,plantout)
y(plantin,plantout)
y(plantin,sink)
y(plantout,customer)
y(plantout,plantin)
y(source1,plantin)
y(source2,plantin)
z(customer,plantout,ship)
z(customer,plantout,vehicle)
z(plantin,plantout,line1)
z(plantin,plantout,line2)
z(plantin,sink,ship)
z(plantout,customer,ship)
z(plantout,customer,vehicle)
z(plantout,plantin,line3)
z(source1,plantin,vehicle)
z(source2,plantin,ship)
z_0,customer,plantout,ship,retbottle_
z_0,customer,plantout,vehicle,retbottle_
z_0,plantin,plantout,line1,juice1_
z_0,plantin,plantout,line1,juice2_
z_0,plantin,plantout,line2,juice1_
z_0,plantin,plantout,line2,juice2_
z_0,plantin,sink,ship,glass_
z_0,plantout,customer,ship,juice1_
z_0,plantout,customer,ship,juice2_
z_0,plantout,customer,vehicle,juice1_
z_0,plantout,customer,vehicle,juice2_
z_0,plantout,plantin,line3,retbottle_
z_0,source1,plantin,vehicle,apple_
z_0,source1,plantin,vehicle,melon_
z_0,source2,plantin,ship,bottle_
z_1,customer,plantout,ship,retbottle_
z_1,customer,plantout,vehicle,retbottle_
z_1,plantin,plantout,line1,juice1_
z_1,plantin,plantout,line1,juice2_
z_1,plantin,plantout,line2,juice1_
z_1,plantin,plantout,line2,juice2_
z_1,plantin,sink,ship,glass_
z_1,plantout,customer,ship,juice1_
z_1,plantout,customer,ship,juice2_
z_1,plantout,customer,vehicle,juice1_
z_1,plantout,customer,vehicle,juice2_
z_1,plantout,plantin,line3,retbottle_
z_1,source1,plantin,vehicle,apple_
z_1,source1,plantin,vehicle,melon_
z_1,source2,plantin,ship,bottle_
z_10,source1,plantin,vehicle,apple_
z_10,source1,plantin,vehicle,melon_
z_10,source2,plantin,ship,bottle_
z_11,source1,plantin,vehicle,apple_
z_11,source1,plantin,vehicle,melon_
z_11,source2,plantin,ship,bottle_
z_12,source1,plantin,vehicle,apple_
z_12,source1,plantin,vehicle,melon_
z_12,source2,plantin,ship,bottle_
z_13,source1,plantin,vehicle,apple_
z_13,source1,plantin,vehicle,melon_
z_13,source2,plantin,ship,bottle_
z_14,source1,plantin,vehicle,apple_
z_14,source1,plantin,vehicle,melon_
z_14,source2,plantin,ship,bottle_
z_15,source1,plantin,vehicle,apple_
z_15,source1,plantin,vehicle,melon_
z_15,source2,plantin,ship,bottle_
z_16,source1,plantin,vehicle,apple_
z_16,source1,plantin,vehicle,melon_
z_16,source2,plantin,ship,bottle_
z_17,source1,plantin,vehicle,apple_
z_17,source1,plantin,vehicle,melon_
z_17,source2,plantin,ship,bottle_
z_18,source1,plantin,vehicle,apple_
z_18,source1,plantin,vehicle,melon_
z_18,source2,plantin,ship,bottle_
z_19,source1,plantin,vehicle,apple_
z_19,source1,plantin,vehicle,melon_
z_19,source2,plantin,ship,bottle_
z_2,customer,plantout,ship,retbottle_
z_2,customer,plantout,vehicle,retbottle_
z_2,plantin,plantout,line1,juice1_
z_2,plantin,plantout,line1,juice2_
z_2,plantin,plantout,line2,juice1_
z_2,plantin,plantout,line2,juice2_
z_2,plantin,sink,ship,glass_
z_2,plantout,customer,ship,juice1_
z_2,plantout,customer,ship,juice2_
z_2,plantout,customer,vehicle,juice1_
z_2,plantout,customer,vehicle,juice2_
z_2,plantout,plantin,line3,retbottle_
z_2,source1,plantin,vehicle,apple_
z_2,source1,plantin,vehicle,melon_
z_2,source2,plantin,ship,bottle_
z_20,source1,plantin,vehicle,apple_
z_20,source1,plantin,vehicle,melon_
z_20,source2,plantin,ship,bottle_
z_21,source1,plantin,vehicle,apple_
z_21,source1,plantin,vehicle,melon_
z_21,source2,plantin,ship,bottle_
z_22,source1,plantin,vehicle,apple_
z_22,source1,plantin,vehicle,melon_
z_22,source2,plantin,ship,bottle_
z_23,source1,plantin,vehicle,apple_
z_23,source1,plantin,vehicle,melon_
z_23,source2,plantin,ship,bottle_
z_24,source1,plantin,vehicle,apple_
z_24,source1,plantin,vehicle,melon_
z_24,source2,plantin,ship,bottle_
z_25,source1,plantin,vehicle,apple_
z_25,source1,plantin,vehicle,melon_
z_25,source2,plantin,ship,bottle_
z_26,source1,plantin,vehicle,apple_
z_26,source1,plantin,vehicle,melon_
z_26,source2,plantin,ship,bottle_
z_27,source1,plantin,vehicle,apple_
z_27,source1,plantin,vehicle,melon_
z_27,source2,plantin,ship,bottle_
z_28,source1,plantin,vehicle,apple_
z_28,source1,plantin,vehicle,melon_
z_28,source2,plantin,ship,bottle_
z_29,source1,plantin,vehicle,apple_
z_29,source1,plantin,vehicle,melon_
z_29,source2,plantin,ship,bottle_
z_3,customer,plantout,ship,retbottle_
z_3,customer,plantout,vehicle,retbottle_
z_3,plantin,plantout,line1,juice1_
z_3,plantin,plantout,line1,juice2_
z_3,plantin,plantout,line2,juice1_
z_3,plantin,plantout,line2,juice2_
z_3,plantin,sink,ship,glass_
z_3,plantout,customer,ship,juice1_
z_3,plantout,customer,ship,juice2_
z_3,plantout,customer,vehicle,juice1_
z_3,plantout,customer,vehicle,juice2_
z_3,plantout,plantin,line3,retbottle_
z_3,source1,plantin,vehicle,apple_
z_3,source1,plantin,vehicle,melon_
z_3,source2,plantin,ship,bottle_
z_30,source1,plantin,vehicle,apple_
z_30,source1,plantin,vehicle,melon_
z_30,source2,plantin,ship,bottle_
z_31,source1,plantin,vehicle,apple_
z_31,source1,plantin,vehicle,melon_
z_31,source2,plantin,ship,bottle_
z_32,source1,plantin,vehicle,apple_
z_32,source1,plantin,vehicle,melon_
z_32,source2,plantin,ship,bottle_
z_33,source1,plantin,vehicle,apple_
z_33,source1,plantin,vehicle,melon_
z_33,source2,plantin,ship,bottle_
z_34,source1,plantin,vehicle,apple_
z_34,source1,plantin,vehicle,melon_
z_34,source2,plantin,ship,bottle_
z_35,source1,plantin,vehicle,apple_
z_35,source1,plantin,vehicle,melon_
z_35,source2,plantin,ship,bottle_
z_36,source1,plantin,vehicle,apple_
z_36,source1,plantin,vehicle,melon_
z_36,source2,plantin,ship,bottle_
z_37,source1,plantin,vehicle,apple_
z_37,source1,plantin,vehicle,melon_
z_37,source2,plantin,ship,bottle_
z_38,source1,plantin,vehicle,apple_
z_38,source1,plantin,vehicle,melon_
z_38,source2,plantin,ship,bottle_
z_39,source1,plantin,vehicle,apple_
z_39,source1,plantin,vehicle,melon_
z_39,source2,plantin,ship,bottle_
z_4,customer,plantout,ship,retbottle_
z_4,customer,plantout,vehicle,retbottle_
z_4,plantin,plantout,line1,juice1_
z_4,plantin,plantout,line1,juice2_
z_4,plantin,plantout,line2,juice1_
z_4,plantin,plantout,line2,juice2_
z_4,plantin,sink,ship,glass_
z_4,plantout,customer,ship,juice1_
z_4,plantout,customer,ship,juice2_
z_4,plantout,customer,vehicle,juice1_
z_4,plantout,customer,vehicle,juice2_
z_4,plantout,plantin,line3,retbottle_
z_4,source1,plantin,vehicle,apple_
z_4,source1,plantin,vehicle,melon_
z_4,source2,plantin,ship,bottle_
z_40,source1,plantin,vehicle,apple_
z_40,source1,plantin,vehicle,melon_
z_40,source2,plantin,ship,bottle_
z_41,source1,plantin,vehicle,apple_
z_41,source1,plantin,vehicle,melon_
z_41,source2,plantin,ship,bottle_
z_42,source1,plantin,vehicle,apple_
z_42,source1,plantin,vehicle,melon_
z_42,source2,plantin,ship,bottle_
z_43,source1,plantin,vehicle,apple_
z_43,source1,plantin,vehicle,melon_
z_43,source2,plantin,ship,bottle_
z_44,source1,plantin,vehicle,apple_
z_44,source1,plantin,vehicle,melon_
z_44,source2,plantin,ship,bottle_
z_45,source1,plantin,vehicle,apple_
z_45,source1,plantin,vehicle,melon_
z_45,source2,plantin,ship,bottle_
z_46,source1,plantin,vehicle,apple_
z_46,source1,plantin,vehicle,melon_
z_46,source2,plantin,ship,bottle_
z_47,source1,plantin,vehicle,apple_
z_47,source1,plantin,vehicle,melon_
z_47,source2,plantin,ship,bottle_
z_48,source1,plantin,vehicle,apple_
z_48,source1,plantin,vehicle,melon_
z_48,source2,plantin,ship,bottle_
z_49,source1,plantin,vehicle,apple_
z_49,source1,plantin,vehicle,melon_
z_49,source2,plantin,ship,bottle_
z_5,customer,plantout,ship,retbottle_
z_5,customer,plantout,vehicle,retbottle_
z_5,plantin,plantout,line1,juice1_
z_5,plantin,plantout,line1,juice2_
z_5,plantin,plantout,line2,juice1_
z_5,plantin,plantout,line2,juice2_
z_5,plantin,sink,ship,glass_
z_5,plantout,customer,ship,juice1_
z_5,plantout,customer,ship,juice2_
z_5,plantout,customer,vehicle,juice1_
z_5,plantout,customer,vehicle,juice2_
z_5,plantout,plantin,line3,retbottle_
z_5,source1,plantin,vehicle,apple_
z_5,source1,plantin,vehicle,melon_
z_5,source2,plantin,ship,bottle_
z_6,customer,plantout,ship,retbottle_
z_6,customer,plantout,vehicle,retbottle_
z_6,plantin,plantout,line1,juice1_
z_6,plantin,plantout,line1,juice2_
z_6,plantin,plantout,line2,juice1_
z_6,plantin,plantout,line2,juice2_
z_6,plantin,sink,ship,glass_
z_6,plantout,customer,ship,juice1_
z_6,plantout,customer,ship,juice2_
z_6,plantout,customer,vehicle,juice1_
z_6,plantout,customer,vehicle,juice2_
z_6,plantout,plantin,line3,retbottle_
z_6,source1,plantin,vehicle,apple_
z_6,source1,plantin,vehicle,melon_
z_6,source2,plantin,ship,bottle_
z_7,customer,plantout,ship,retbottle_
z_7,customer,plantout,vehicle,retbottle_
z_7,plantin,plantout,line1,juice1_
z_7,plantin,plantout,line1,juice2_
z_7,plantin,plantout,line2,juice1_
z_7,plantin,plantout,line2,juice2_
z_7,plantin,sink,ship,glass_
z_7,plantout,customer,ship,juice1_
z_7,plantout,customer,ship,juice2_
z_7,plantout,customer,vehicle,juice1_
z_7,plantout,customer,vehicle,juice2_
z_7,plantout,plantin,line3,retbottle_
z_7,source1,plantin,vehicle,apple_
z_7,source1,plantin,vehicle,melon_
z_7,source2,plantin,ship,bottle_
z_8,customer,plantout,ship,retbottle_
z_8,customer,plantout,vehicle,retbottle_
z_8,plantin,plantout,line1,juice1_
z_8,plantin,plantout,line1,juice2_
z_8,plantin,plantout,line2,juice1_
z_8,plantin,plantout,line2,juice2_
z_8,plantin,sink,ship,glass_
z_8,plantout,customer,ship,juice1_
z_8,plantout,customer,ship,juice2_
z_8,plantout,customer,vehicle,juice1_
z_8,plantout,customer,vehicle,juice2_
z_8,plantout,plantin,line3,retbottle_
z_8,source1,plantin,vehicle,apple_
z_8,source1,plantin,vehicle,melon_
z_8,source2,plantin,ship,bottle_
z_9,customer,plantout,ship,retbottle_
z_9,customer,plantout,vehicle,retbottle_
z_9,plantin,plantout,line1,juice1_
z_9,plantin,plantout,line1,juice2_
z_9,plantin,plantout,line2,juice1_
z_9,plantin,plantout,line2,juice2_
z_9,plantin,sink,ship,glass_
z_9,plantout,customer,ship,juice1_
z_9,plantout,customer,ship,juice2_
z_9,plantout,customer,vehicle,juice1_
z_9,plantout,customer,vehicle,juice2_
z_9,plantout,plantin,line3,retbottle_
z_9,source1,plantin,vehicle,apple_
z_9,source1,plantin,vehicle,melon_
z_9,source2,plantin,ship,bottle_
End
