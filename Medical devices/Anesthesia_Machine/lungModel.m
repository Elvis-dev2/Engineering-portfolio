function Volume = lungModel(flow,Ts)

Volume = cumsum(flow)*Ts;

end