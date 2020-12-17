epsilon=0.1;
c=2;
tic;
[avg, avg_UCB] = deal(zeros(1000));
[Reward_eG, Reward_UCB] = deal(zeros(2000,1000));
for n=1:2000
    [A, R, Q, A_UCB, R_UCB, Q_UCB] = deal(zeros(10,1000));
    for i=1:10
        q_star(i)= normrnd(0,1);        
    end
    f= randi(10);
    A(f,1)=1;
    R(f,1)= normrnd(q_star(f),1);
    A_UCB(f,1)=1;
    R_UCB(f,1)= normrnd(q_star(f),1);
    for t=2:1000
        for i=1:10
            if nnz(A(i,:))~=0
                Q(i,t)= sum(R(i,:))/nnz(A(i,:));
            else
                Q(i,t)=0;
            end
            if nnz(A_UCB(i,:))~=0
                Q_UCB(i,t) = (sum(R_UCB(i,:))/nnz(A_UCB(i,:))) + c*sqrt(log(t)/nnz(A_UCB(i,:)));
            else
                Q_UCB(i,t)=0;
            end
            
        end
        
        [M,I]= max(Q(:,(t-1)));
        K= find(Q(:,(t-1))==M);
        r= randi(length(K));
        k= K(r);
        if (epsilon<=rand())
            A(k,t)=1;
            R(k,t)= normrnd(q_star(k),1); 
            A_UCB(k,t)=1;
            R_UCB(k,t)= normrnd(q_star(k),1);
            
        else
            rnd = randi(10);
            A(rnd,t)=1;
            R(rnd,t)= normrnd(q_star(rnd),1);
            Q_UCB(k,:) = [];
            [M_UCB,I_UCB] =  max(Q_UCB(:,(t-1)));
            K_UCB = find(Q_UCB(:,(t-1))==M_UCB);
            r_UCB = randi(length(K_UCB));
            k_UCB = K_UCB(r_UCB);
            A_UCB(k_UCB,t)=1;
            R_UCB(k_UCB,t)= normrnd(q_star(k_UCB),1);          
        end 
    end
Reward_eG(n,:)=sum(R);
Reward_UCB(n,:) = sum(R_UCB);
end
for t=1:1000
    avg(t)= mean(Reward_eG(:,t));
    avg_UCB(t) = mean(Reward_UCB(:,t));
end
t=1:1000;
plot(t,avg,'g')
hold on;
plot(t,avg_UCB, 'b')
xlabel('Steps')
ylabel('Average Reward')
legend({'e-greedy e = 0.1','UCB c = 2'},'Location','southeast')
toc;