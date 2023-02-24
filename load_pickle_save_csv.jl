### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ c53a0c36-b226-11ed-2eab-afec8c49019b
begin
	using Pkg
	Pkg.activate(".")
	using Pluto 
	using PlutoUI 
	using CSV 
	using DataFrames 
	using DataFramesMeta 
	using CairoMakie
	using Pandas
	using Chain
	using Images
	using FileIO
end

# ╔═╡ f67e7a5f-6a98-4322-9ac9-9ecb95c79626
md"""
# Cross Talk
"""

# ╔═╡ b76c1b79-2d40-4d48-aab5-466b41e7f988
md"""
## Rigetti M3 Lattice
"""

# ╔═╡ 991c12bf-3fb1-4655-9f49-b882d924929a
load("figs/rigetti_m3_lattice.png")

# ╔═╡ 6648181d-1c30-41a3-8b4f-7de04a7d9269
md"""
### Qubits labelled
"""

# ╔═╡ d465a5a3-e27d-4800-925f-52ef99215766
load("figs/rigetti_m3_lattice_numbered.png")

# ╔═╡ 25458b2c-9684-45d6-b601-c3d7730e6c3a
md"""
### Path of measurement
"""

# ╔═╡ e2cb53ac-e4ff-404e-b93e-f00b314befbd
load("figs/rigetti_m3_lattice_path.png")

# ╔═╡ 1ad26bef-93a6-4c48-aa50-af7db31cd676
md"""
## Calibration matrix

After some $N$ shots, each computational basis being measured a calibration matrix results. Each row is a probability vector where it's row indicates what a specific state was initialised in. For $A_{i,1..n}$ = $p_{i,1},..,p_{i,n}$, with $i$ being the row index and $1..n$ indicating all of the columns, then $\sum A = \sum_j p_{j|i} = 1$, for a fixed $i$.
"""

# ╔═╡ a2eef752-e9c7-4842-a80d-f89cef467513
load("figs/prepared_measured_abstract_fig.png")

# ╔═╡ 1cd2eae1-58bf-4ba0-a0f6-0cbfefa6f970
md"""
To observe cross-talk we look at when we prepare in $\ket{10}$ and observe how much we measure in $\ket{11}$. We also observer when we prepare in $\ket{01}$ and measure in $\ket{11}$.

We consider the difference in readout error.

For $p_{i|j = 0} - p_{i|j = 1}$

When we wish to obtain the probability that a measured state is prepared in a certain state $\ket{\psi}$ which is measured in $\ket{\tilde{\psi}}$.

$P(\ket{\psi} \rightarrow \ket{\tilde{\psi}})$

We look at prepared $\ket{00}$ and observe the measured states $\ket{00}$ and $\ket{01}$ and compute the difference in probabilities.

$P(\ket{00} \rightarrow \ket{00}) - P(\ket{00} \rightarrow \ket{01})$

$P(\ket{00} \rightarrow \ket{00}) - P(\ket{00} \rightarrow \ket{10})$
"""

# ╔═╡ e7696747-103f-48df-b327-c9badf491645
md"""
## Define cross-talk

Let $q_i$ and $q_j$, for $i\neq j$, be two qubits that we prepare and measure in a quantum circuit $N$ times. If $q_i$ is initated in the $\ket{1}$ state and $q_j$ is initiated in the $\ket{0}$ state then cross-talk between these two qubits occurs when the probability that $q_j$ is measured in the $\ket{1}$ is greater than being measured in its initiated state, $\ket{0}$, and greater than general measurement noise.
"""

# ╔═╡ e49c6761-6fb9-4429-97da-4b485bc1dc47
md"""
## Load data
"""

# ╔═╡ 843e9549-9b1b-4b01-85f6-279b7a2827a7
pickle_path = "data/20211013_TwoQubitCrossTalk_AspenM3_CalMatrices.pkl"

# ╔═╡ 58a8710e-6497-4ff1-9298-83a5027ca87b
md"""
Data is in `pkl` format from pythong, we use `Pandas.jl` to load each calibration matrix.
"""

# ╔═╡ 8d9fb451-4ed2-4ff3-9920-d35a876b4096
 df = read_pickle(pickle_path)

# ╔═╡ 06a5e724-92a1-42df-bd09-a70487c2b03d
qubit_path = [6,7,0,1,16,17,10,11,26,27,20,21,36,37,30,31,46,47,40]

# ╔═╡ d24e2854-e177-45b5-ab48-fea4ddcbf9bc
md"""
## Explore the cross talk between qubit 6 and qubit 7
"""

# ╔═╡ c0dd3a78-7769-4af0-9f33-5c5832cb2407
df₆₇ = df[1]

# ╔═╡ 98303bc1-940b-47ea-84ab-17fe02693ad1
df₆₇[1,1]

# ╔═╡ c36fb724-f3b9-4d19-9944-3b67b0f8f6cb
md"""

$P(|00> \rightarrow |00>) - P(|00> \rightarrow |01>)$

"""

# ╔═╡ f94a61b0-71e5-4131-a8d9-292037e27cfc
one_way = (df₆₇[1,1] - df₆₇[1,3])

# ╔═╡ 3ce2382f-5273-40eb-a7e1-afd98d7edcf9
md"""

$P(|10> \rightarrow |10>) - P(|10> \rightarrow |11>)$

"""

# ╔═╡ 525f9e29-11d1-4b40-8a94-5ea063c4c239
other_way = (df₆₇[2,2] - df₆₇[2,4])

# ╔═╡ 278cfa11-7357-400a-9b6f-46b72b10f1ef


# ╔═╡ Cell order:
# ╟─f67e7a5f-6a98-4322-9ac9-9ecb95c79626
# ╟─c53a0c36-b226-11ed-2eab-afec8c49019b
# ╟─b76c1b79-2d40-4d48-aab5-466b41e7f988
# ╟─991c12bf-3fb1-4655-9f49-b882d924929a
# ╟─6648181d-1c30-41a3-8b4f-7de04a7d9269
# ╟─d465a5a3-e27d-4800-925f-52ef99215766
# ╟─25458b2c-9684-45d6-b601-c3d7730e6c3a
# ╟─e2cb53ac-e4ff-404e-b93e-f00b314befbd
# ╟─1ad26bef-93a6-4c48-aa50-af7db31cd676
# ╟─a2eef752-e9c7-4842-a80d-f89cef467513
# ╟─1cd2eae1-58bf-4ba0-a0f6-0cbfefa6f970
# ╟─e7696747-103f-48df-b327-c9badf491645
# ╟─e49c6761-6fb9-4429-97da-4b485bc1dc47
# ╠═843e9549-9b1b-4b01-85f6-279b7a2827a7
# ╟─58a8710e-6497-4ff1-9298-83a5027ca87b
# ╠═8d9fb451-4ed2-4ff3-9920-d35a876b4096
# ╠═06a5e724-92a1-42df-bd09-a70487c2b03d
# ╟─d24e2854-e177-45b5-ab48-fea4ddcbf9bc
# ╠═c0dd3a78-7769-4af0-9f33-5c5832cb2407
# ╠═98303bc1-940b-47ea-84ab-17fe02693ad1
# ╟─c36fb724-f3b9-4d19-9944-3b67b0f8f6cb
# ╠═f94a61b0-71e5-4131-a8d9-292037e27cfc
# ╟─3ce2382f-5273-40eb-a7e1-afd98d7edcf9
# ╠═525f9e29-11d1-4b40-8a94-5ea063c4c239
# ╠═278cfa11-7357-400a-9b6f-46b72b10f1ef
