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

# ╔═╡ a32840fb-a432-408c-be05-d37f4f95b0e7
using Random, Distributions, StatsBase, StatsPlots, LinearAlgebra, DataFrames, LaTeXStrings, PlutoUI

# ╔═╡ e0b06eb0-0cea-4491-8bad-1d0b19dc2ffc
PlutoUI.TableOfContents()

# ╔═╡ f974e162-359a-11ec-3dd3-9ff38609caa5
md"

# ECE537: Lab 2 Report
> _It is recommended to access this report by opening the `html` file on the browser or by clicking [here](https://pranshumalik14.github.io/ece537-labs/lab2/lab2.jl.html)_.

In the first part of the lab, we will be creating and analyzing joint Gaussian distributions as a part of which we will be extracting marginal densities of the joint random variables. In the second part, we will be simulating the central limit theorem and the law of large numbers with uniform (univariate) random variables and test for the relevant convergence cirtieria.

Throughout this lab, the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) package in Julia has been utilized to be able to use the probabllity constructs in code.

"

# ╔═╡ cf6f5454-a62b-4d82-81c7-4b2c98d6fa22
md"

## 1.Simulating Bivariate Gaussian Distributions

The multivariate normal (or Gaussian) distribution is a multidimensional generalization of the normal distribution. The probability density function of a $n$-dimensional multivariate normal distribution with mean vector $\boldsymbol{\mu}$ and (positive definite) covariance matrix $\boldsymbol{\Sigma}$ is:

$f_{\mathbf{X}}(\mathbf{x}; \boldsymbol{\mu},\boldsymbol{\Sigma}) = \frac{1}{\sqrt{(2\pi)^n \text{det}(\boldsymbol{\Sigma})}} \exp\left(-\frac{1}{2}(\mathbf{x}-\boldsymbol{\mu})^\intercal\boldsymbol{\Sigma}^{-1}(\mathbf{x}-\boldsymbol{\mu})\right).$

We will proceed with using its implementation provided as the `MvNormal` distribution struct or type, with $n=2$ to make it a bivariate distribution.


For  with individual means $\mu_1, \mu_2$, standard deviations $\sigma_1, \sigma_2$, and correlation coefficient $\rho$, the bivariate normal distribution can be defined as:

$X \sim \mathcal{N}\left(\boldsymbol{\mu}=
\begin{bmatrix}
	\mu_1 \\
	\mu_2
\end{bmatrix},
\boldsymbol{\Sigma}=\begin{bmatrix}
	\sigma_1^2 & \rho\sigma_1\sigma_2 \\
	\rho\sigma_1\sigma_2 & \sigma_2^2
\end{bmatrix}\right).$

"

# ╔═╡ fb4e913f-eac0-45d5-9828-32cc4f0d9fbe
md"

### 1.1 Numerical Simulation

We will now define and sample various bivariate normal distributions and inspect their coverage and densities through scatter plots. Below is a slider for the number of samples we wish to take of all the distributions.

𝑁₁ = $(@bind N₁ Slider(50:50:7000; show_value=true, default=3000))

We define below an uncorrelated bivariate normal distribution with zero mean and unit variances, $X \sim \mathcal{N}(\mathbf{0}, \text{Diag}(1,1))$:

"

# ╔═╡ e2b52309-9b20-4ee8-b22c-a10bbc01ce37
function matrixtotuple(x::AbstractMatrix{T}) where T
	r,c = size(x)	
	pts = Vector{Tuple}(undef,c)
	@time @inbounds for i in 1:c
		pts[i] = Tuple(x[:,i])
	end
	return pts
end

# ╔═╡ 11861633-309d-4a19-bab0-88cc752fb6a5
𝑋 = MvNormal(zeros(2), I(2));

# ╔═╡ 5f5998fc-8954-4738-ab9e-54e5db821eb2
𝑋samples = rand(𝑋, N₁) |> matrixtotuple;

# ╔═╡ fae5f520-cd44-4595-b5b8-e87fe215d15d
begin
	scatter(𝑋samples, alpha=800.0/N₁, legend=false, markerstrokewidth=0)
	xlabel!(L"X_1")
	ylabel!(L"X_2")
	title!(L"(X_1, X_2) \sim \mathcal{N}(\mathbf{0}, \mathbf{I})")
end

# ╔═╡ 1f7c1317-10e9-4e3f-ba24-9fa337a5a4da
begin
	marginalhist(𝑋samples; bins=50)
end

# ╔═╡ 4caafd5b-f077-4238-b9a5-5b72d0b5f9ac
md"

!!! note
    rewrite this section!!

Now, we will also define correlated bivartie normal distributions. Since, the covariance matrix depends on the correlation coefficient, $\rho$ and the standrd devaiations $\sigma_1, \sigma_2$, we will define a generic function, $\boldsymbol{\Sigma}(\rho, \sigma_1, \sigma_2)$, to generate such matrices for valid covaraince matrices.

"

# ╔═╡ 9f1001fc-f7cb-47e6-abc2-3c46d05d4ade
function Σ(σ₁, σ₂, ρ)
	@assert abs(ρ) ≤ 1
	
	# add epsilon for numerical stability
	ϵ = 0.0001
	return ϵ*I(2) + [σ₁^2    ρ*σ₁*σ₂;
				 	 ρ*σ₁*σ₂ σ₂^2]
end

# ╔═╡ a647164f-8585-40bf-9036-729da288a0ca
md"

Now, we will define 5 distributins with all with mean [1 2]^T and std. dev []^T and corr = {-1, -0.5, 0, 0.5, 1}

"

# ╔═╡ bfc79861-8ca7-4aa0-b9a2-0e9e77c98be5
μ = [1; 2];

# ╔═╡ c7a54c8f-f68a-4f6f-ab33-0aff066f4542
𝑋ᵨ = [MvNormal(μ, Σ(√2, 1, ρ)) for ρ ∈ -1:0.5:1];

# ╔═╡ 05318f3b-2b49-4e73-b147-d4402cbc24f0
md"

The marginal is of partition is equal to:

$\mathcal{N}(\boldsymbol{\mu}_\mathbf{X}, \boldsymbol{\Sigma}_{\mathbf{X}\mathbf{X}})$

"

# ╔═╡ ae16d377-2f11-4b64-baa1-d1ad1f629b9b
𝑋ᵨsamples = [rand(𝑋, N₁) |> matrixtotuple for 𝑋 ∈ 𝑋ᵨ]

# ╔═╡ 06ba1279-2c12-45f9-88d8-cdcfd4000181
scatter(𝑋ᵨsamples[1])

# ╔═╡ 43174d96-c3aa-4349-9be3-6e3008c47ce2
scatter(𝑋ᵨsamples[2])

# ╔═╡ 0f288920-2f54-4391-965f-236afc8ffb2b
scatter(𝑋ᵨsamples[3])

# ╔═╡ 53c02a85-285f-447d-b188-9952dd8d2733
scatter(𝑋ᵨsamples[4])

# ╔═╡ 5645b874-5a0f-467a-9d6f-1b0d3fb382f1
scatter(𝑋ᵨsamples[5])

# ╔═╡ a4e41a9b-e396-42df-a9ef-04c9f7206cc9
md"

### 1.2 Summary of Results

Here we will test for a fixed number of samples, N=100, and then see if the marginal distribution matches the expected distribution and whether the experiemental fit and observed variances match the theoretical answer.

"

# ╔═╡ db4852fe-28f0-470d-b699-a824b77c3961
md"

## 2. 

"

# ╔═╡ 64984036-d40c-4849-b268-b705e3c90bdb
md"

## 3. Code

Note that this lab report can be run on the cloud and viewed as is on the github repository page [here](https://pranshumalik14.github.io/ece537-labs/lab2/lab2.jl.html). All code for the notebook can be accessed [here](https://github.com/pranshumalik14/ece537-labs).

"

# ╔═╡ Cell order:
# ╟─e0b06eb0-0cea-4491-8bad-1d0b19dc2ffc
# ╟─f974e162-359a-11ec-3dd3-9ff38609caa5
# ╠═a32840fb-a432-408c-be05-d37f4f95b0e7
# ╟─cf6f5454-a62b-4d82-81c7-4b2c98d6fa22
# ╟─fb4e913f-eac0-45d5-9828-32cc4f0d9fbe
# ╟─e2b52309-9b20-4ee8-b22c-a10bbc01ce37
# ╠═11861633-309d-4a19-bab0-88cc752fb6a5
# ╠═5f5998fc-8954-4738-ab9e-54e5db821eb2
# ╟─fae5f520-cd44-4595-b5b8-e87fe215d15d
# ╟─1f7c1317-10e9-4e3f-ba24-9fa337a5a4da
# ╟─4caafd5b-f077-4238-b9a5-5b72d0b5f9ac
# ╠═9f1001fc-f7cb-47e6-abc2-3c46d05d4ade
# ╟─a647164f-8585-40bf-9036-729da288a0ca
# ╠═bfc79861-8ca7-4aa0-b9a2-0e9e77c98be5
# ╠═c7a54c8f-f68a-4f6f-ab33-0aff066f4542
# ╟─05318f3b-2b49-4e73-b147-d4402cbc24f0
# ╠═ae16d377-2f11-4b64-baa1-d1ad1f629b9b
# ╠═06ba1279-2c12-45f9-88d8-cdcfd4000181
# ╠═43174d96-c3aa-4349-9be3-6e3008c47ce2
# ╠═0f288920-2f54-4391-965f-236afc8ffb2b
# ╠═53c02a85-285f-447d-b188-9952dd8d2733
# ╠═5645b874-5a0f-467a-9d6f-1b0d3fb382f1
# ╟─a4e41a9b-e396-42df-a9ef-04c9f7206cc9
# ╠═db4852fe-28f0-470d-b699-a824b77c3961
# ╟─64984036-d40c-4849-b268-b705e3c90bdb
