using Pkg
Pkg.activate(".")
using CSV
using DataFrames
using DataFramesMeta
using CairoMakie
using Pandas

qdata = "/Users/jmille15/Data/QuantumData/ReadoutNoiseCharacterisation"
pick_file = "data/20211013_TwoQubitCrossTalk_AspenM3_CalMatrices.pkl"
pickle_path = joinpath(qdata,pick_file)
df = read_pickle(pickle_path)

qubit_path = [6,7,0,1,16,17,10,11,26,27,20,21,36,37,30,31,46,47,40]

df[1][1,4]

mat = df[1]

prob_01_11 = mat[3,1] + mat[3,2] + mat[4,1] + mat[4,1]
prob_11_01 = mat[1,3] + mat[1,4] + mat[3,4]#mat[3,3] + mat[3,4]
1 - prob_01_11 - prob_11_01