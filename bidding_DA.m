%%%广义纳什博弈%%%
%%%仅报价一轮，预测其他充电站的出力，各自求解MPEC模型%%%
clear
clc
load Bid_reference
data.pi_DA=pi_DA_reference;
%充电站1
data.CS_number=1;
result_CS1=bidding_DA_callback(data);
%充电站2
data.CS_number=2;
result_CS2=bidding_DA_callback(data);
%充电站3
data.CS_number=3;
result_CS3=bidding_DA_callback(data);
%充电站4
data.CS_number=4;
result_CS4=bidding_DA_callback(data);
Pch_expect=[result_CS1.Pch(1,:);result_CS2.Pch(2,:);result_CS3.Pch(3,:);result_CS4.Pch(4,:)];%期望充电功率
Pdis_expect=[result_CS1.Pdis(1,:);result_CS2.Pdis(2,:);result_CS3.Pdis(3,:);result_CS4.Pdis(4,:)];%期望放电功率
Bid_price=[result_CS1.pi_DA(1,:);result_CS2.pi_DA(2,:);result_CS3.pi_DA(3,:);result_CS4.pi_DA(4,:)];%报价
Bid_price=round(Bid_price*100)/100;%数值处理，避免精度问题
save('Bid_DA_final','Bid_price','Pch_expect','Pdis_expect');%日前决策汇总
