### A Pluto.jl notebook ###
# v0.19.25

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 328c0366-58a8-40fd-b9b7-30bf72ffcbf5
using Distributions, StatsBase, StatsPlots, LinearAlgebra, LaTeXStrings, PlutoUI

# ╔═╡ b9f6d0bf-a8e9-45e8-86c7-c4916f609a3d
PlutoUI.TableOfContents()

# ╔═╡ d6393fad-140a-4e75-986c-86a6ebcdad4a
md"

# ECE537: Lab 3 Report
> _It is recommended to access this report by opening the `html` file on the browser or by clicking [here](https://pranshumalik14.github.io/ece537-labs/lab3/lab3.jl.html)_.

In the first part of the lab, we will be.

Throughout this lab, the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) package in Julia has been utilized to be able to use the probability constructs in code.

"

# ╔═╡ bf3af91d-7171-418d-bfd8-317b17c21502
md"

## 1. Simulating A Random Walk Process

A discrete random walk process, $$Z(n)$$ is given by,

$$Z(n) = \displaystyle\sum_{i=1}^{n}X_i \text{ },$$

where $$X_i$$ are i.i.d. random variables with pmf $$p_{X}(1) = p$$ and $$p_X(-1) = 1-p$$. $$\color{red}{\text{insert info about mean and variance}}$$

"

# ╔═╡ f1d51c08-d771-492f-a5ef-ce134101dad1
md"

### 1.1 Numerical Simulation
We will test

𝑛₁ = $(@bind 𝑛₁ Slider(1:1:10000; show_value=true, default=50))

𝑝  = $(@bind 𝑝 Slider(0:0.001:1; show_value=true, default=0.5))

"

# ╔═╡ 9dc96d36-1c37-4951-a531-f099f4020913
pmf = [1-𝑝, 0, 𝑝]; # for k = 1, 2, 3; therefore; need to location scale

# ╔═╡ bf4a3f81-c7ad-4c4b-8a4d-3792ea58807c
𝑋(n) = [LocationScale(-2, 1, Categorical(pmf)) for n ∈ 1:n] # 𝑋 with pₓ(k-2) = pmf[k]

# ╔═╡ a1d36975-5696-4718-9876-114310503aba
𝑋ᵢ = 𝑋(𝑛₁);

# ╔═╡ a980400d-88ec-41f3-90d0-5393ab8fdcf9
mean(rand.(𝑋ᵢ))

# ╔═╡ bbb0a790-6a81-4707-8d07-51fe9cdbb3fb
𝑍(𝑋ᵢ, n) = rand.(𝑋ᵢ)[1:n] |> sum

# ╔═╡ 5eeb448f-64dc-4afa-b8bc-dd15018d61e3
𝑍ₙ = [𝑍(𝑋ᵢ, n) for n ∈ 1:𝑛₁]

# ╔═╡ 8bd06fff-4ecf-451b-bba5-0f9c94b37869
plot(1:𝑛₁, 𝑍ₙ; linetype=:steppre)

# ╔═╡ 9a4f597d-2649-49c2-bad7-945b28b68a2e
mean(𝑍ₙ)

# ╔═╡ 30b00c83-89f2-4c4c-849a-d96bab90c488
md"

### 1.2 Summary of Results

Here we will test for a fixed number of samples, $N=100$, and observe the characteristics of the bivariate distributions and if they match our expectations.

"

# ╔═╡ Cell order:
# ╟─b9f6d0bf-a8e9-45e8-86c7-c4916f609a3d
# ╟─d6393fad-140a-4e75-986c-86a6ebcdad4a
# ╠═328c0366-58a8-40fd-b9b7-30bf72ffcbf5
# ╟─bf3af91d-7171-418d-bfd8-317b17c21502
# ╟─f1d51c08-d771-492f-a5ef-ce134101dad1
# ╠═9dc96d36-1c37-4951-a531-f099f4020913
# ╠═bf4a3f81-c7ad-4c4b-8a4d-3792ea58807c
# ╠═a1d36975-5696-4718-9876-114310503aba
# ╠═a980400d-88ec-41f3-90d0-5393ab8fdcf9
# ╠═bbb0a790-6a81-4707-8d07-51fe9cdbb3fb
# ╠═5eeb448f-64dc-4afa-b8bc-dd15018d61e3
# ╠═8bd06fff-4ecf-451b-bba5-0f9c94b37869
# ╠═9a4f597d-2649-49c2-bad7-945b28b68a2e
# ╟─30b00c83-89f2-4c4c-849a-d96bab90c488
