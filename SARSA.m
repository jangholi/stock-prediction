function [ team ] = SARSA( sell_price,buy_price,next_node,subnode,team,ind )


    reward = sell_price - buy_price;
    
    for i=1:numel(next_node)-1 % numel is used for counting Number of elements in array
       team(next_node(i),(subnode(i)*2+1),ind)= team(next_node(i),(subnode(i)*2+1),ind) + 0.1*(reward + 0.4*team(next_node(i+1),(subnode(i)*2+1),ind) - team(next_node(i),(subnode(i)*2+1),ind) );
    end
    team(next_node(i),(subnode(i)*2+1),ind)= team(next_node(i),(subnode(i)*2+1),ind) + 0.1*reward;
end