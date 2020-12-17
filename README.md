# epsilon-greedy-and-upper-confidence-bound-algorithms
## 1. epsilon greedy algorithm
Since the value of epsilon is already given for the problem, it was initialized to 0.1 as given in the
problem. The variable n runs for 2000 steps as it is the number of runs that has been implemented for
this problem. Also, 10 random gaussian distributions of q*(t) has been implemented for 10 different
actions (A) in the test-bed. The first action is arbitrarily assigned and thee first reward is sampled from a
normal distribution with mean as 0 and variance as 1. The generalized implementation of the algorithm
takes place from the second time step till the 1000th time step. In the algorithm, Whenever the vector A
(Action vector) has a value 1, then that action has been performed for that time step and whenever it is
0, it has not been performed. So, the number of non zeros in the A vector gives the number of times
actions have been produced which is N. Q estimate has been assigned to be sum of the reward values
divided by the number of times action has been performed. Now that the Q value is assigned for the 10
actions, the max value of Q should be found out to move towards the exploitation option. Whenever there
are multiple maximum values, one of the values is chosen at random and it is assigned as the right action.
The conditional statement (epsilon<=rand()) verifies that this greedy option takes place only 90% of the
times. Whenever a random number is chosen from 0 to 1, the probability of that number being greater
than 0.1 is 0.9. This idea has been exploited to alter the e-greedy algorithm in the program that has been
implemented. So whenever this condition is satisfied, the greedy option takes place and for the remaining
10% of the times, a random action is chosen and is assigned which encourages exploration. Based on these
conditions, the value of action (A) and the value of rewards (R) are assigned for each time step. (This is
shown in lines 31-52). The rewards for every single time step in every single run is stored in the
‘Reward_eG’ variable. Now, the mean value is takes for every single time step for all 2000 runs and this
mean value is plotted in a graph against time steps.

## 2. Upper confidence bound algorithm

The value of c for the UCB algorithm is already provided in the problem statement and hence it is
assigned to be 2 as provided. The variable n represents the number of runs to be taken for the algorithm
and it runs from 1 to 2000. 10 random gaussian distributions were created and assigned to q*(t) for
various actions in the testbed. The action for the first time step was arbitrarily assigned and the reward
for the first time step is sampled from a random gaussian distribution with mean as 0 and variance as 1.
The second timestep onwards, the Q estimate value is created in such a way that it is the sum of all
rewards divided by the number of actions taken. Since ones in the Action matrix represents that an action
took place and zeros represent an action not taking place, total number of actions can be given as the
number of non zeros in the action vector. The Q term has an extra term under the square root which is
the variance or the uncertainty term for estimating the action. This has been implemented in line 24.
Whenever a number is chosen at random from 0 to 1, the probability that the number will be greater than
0.1 will be 0.9. This idea has been implemented to obtain the probability conditions. In the UCB algorithm,
the algorithm is greedy (Exploitation) 90% of the times just like in the e-greedy algorithm, but the
difference comes in the remaining 10% of the times. In e-greedy the, algorithm, randomly chooses the
action but in UCB, the maximum term from the new Q estimate specially created for the UCB algorithm 
(Q_UCB) with the additional uncertainty term was used. Based on these conditions, the value of actions
(A) and the value of rewards (R) are updated for each and every time step (This is implemented in lines
31-52 of the program). The reward for the UCB algorithm is calculated for all runs and for all time steps
and it is summed to get the Reward_UCB. The mean of these rewards for all 2000 runs for each time step
is calculated and stored in avg_UCB. This average value is plotted against time steps to get the graph for
UCB. 


The Program which includes both e-greedy and UCB algorithms together took 372.368389 seconds to
run. 

