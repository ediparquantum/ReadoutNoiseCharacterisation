# 20221121_CrossTalkExploration

## Qubits on the Rigetti M3
A series of measurement experiments was conducted on the Rigetti M3 machine. Starting with qubit 6, qubit 7 was selected and the par formed a circuit. No gates other than those needed to compute the computation basis were used to execute and then measure the ciruit. Once this was completed the same was done for qubt 6 and 0, and for qubit 6 and qubit 1, and again unril qubit 40.


<img src="https://user-images.githubusercontent.com/19248072/220496996-40cc635f-ac43-433f-9954-8aae2e721dff.png"  width="300" height="150"> <img src="https://user-images.githubusercontent.com/19248072/220497092-f3534ddc-b650-4aad-8b9d-fef8203982c5.png"  width="300" height="150"> <img src="https://user-images.githubusercontent.com/19248072/220497132-20617ef5-bfdb-49ca-a365-eb2367ae8026.png"  width="300" height="150">

Here is the set of calibration matrices which result from the experiment.

<img src="https://user-images.githubusercontent.com/19248072/220497118-288e84f5-fb39-4ba6-be80-58dde6129bbd.png" width="600" height="300">

To observe cross talk we look at when we prepare in $|10>$ and observe how much we measure in $|11>$. We also observer when we prepare in $|01>$ and measure in $|11>$.

We consider the difference in readout error.

For $p_{i|j = 0} - p_{i|j = 1}$

When we wish to obtain the probability that a measured state is prepared in a certain state $\psi$ which is measured in $\tilde{\psi}>$.

$P(|\psi> \rightarrow |\tilde{\psi}>)$

We look at prepared $|00>$ and observe the measured states $|00>$ and $|01>$ and compute the difference in probabilities.

$P(|00> \rightarrow |00>) - P(|00> \rightarrow |01>)$

$P(|00> \rightarrow |00>) - P(|00> \rightarrow |10>)$

To explore please a simple example [https://ediparquantum.github.io/ReadoutNoiseCharacterisation/](Doc)
