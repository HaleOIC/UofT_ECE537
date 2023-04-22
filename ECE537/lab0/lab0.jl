### A Pluto.jl notebook ###
# v0.19.25

using Markdown
using InteractiveUtils

# ╔═╡ 3322ec6e-cd2b-41bb-9333-177d0e142b53
using DataStructures

# ╔═╡ bebefcbe-df87-11ed-3325-81e1b955e105
md"
# Lab 0: get Accustomed to Julia and Pluto

In this part, I will show some basic things about how to use the language `Julia`, which about 12 parts:

- variables
- array
- tuple
- data type
- complex and rational number
- basic operator
- mathematical functions
- string
- regular expression
- functions
- process control
- dictionary and set
"

# ╔═╡ 87dd33fe-017f-4b45-ad1d-b45bc4f76c00
md"
## variable
Just like `python`, you can use a variable just by assign its value, like this
"

# ╔═╡ 9139b424-0184-4f25-974d-fdb50d20c21c
x = 10

# ╔═╡ ec4649d9-40dc-41a3-af33-dfb7ceb052c5
md"
Different from the `C++`, it will declare the data_type automatically by the right hand value. and all the rules for naming is just like `C++`.

While if you wanna note some words you can use `#` in a single line, `#=` and `=#` can be used in multiple lines.
"

# ╔═╡ 098e1b1e-d498-44b4-b8da-90c8549b68b1
md"
## array
you can easily define an array just as following examples.
"

# ╔═╡ 7c6570b2-ab24-4c3f-9f8d-49add9dfbd62
arr1 = [1, 2, 3]

# ╔═╡ 46454e3b-dd8f-440e-a125-a43d483995a0
arr2 = [1, "RUNOOB", 2.5, pi]

# ╔═╡ 628c67d4-ae81-4367-a038-56fd9b77a5a7
arr3 = Int64[1, 2, 3]

# ╔═╡ 1b87c96e-0e61-4047-8825-c66af1ac4feb
arr4 = String["GOOGLE", "GITHUB", "GRADESCOPE"]

# ╔═╡ 59a9c7a9-e766-4bd5-85a4-2e0a87b6b0fa
arr5 = Int64[]

# ╔═╡ f773f7fe-ef78-4a7b-945c-4db4bd24aa39
arr2[1], arr2[2], arr2[end]

# ╔═╡ 1022cdfe-ff05-4462-976f-8f50e899cc3f
arr6 = Array{Int64}(undef, 3, 2, 5)

# ╔═╡ 02376a58-38b3-4b48-be06-935d4a11ab0e
arr7 = [0: 10...]

# ╔═╡ 6cb9c653-2fda-4802-b5a2-7d46e8fa8abd
arr8 = collect(0:2:13)

# ╔═╡ a7feb420-e843-4f00-ad5d-ac4f4a913187
range_test = range(stop = 10, step = 1, length = 5)

# ╔═╡ fc7db3ce-ca01-499b-aab5-43c999a64779
arr9 = collect(range_test)

# ╔═╡ b9bb28d6-1f94-4721-ba61-c19f74f7b08d
arr10 = [n * m for n in 1:10, m in 1:10]

# ╔═╡ 5e0567e8-de6c-402d-96a6-8d65ec33f831
sum(1 / n^2 for n in 1:1000)

# ╔═╡ c2559bab-a6c3-4795-b6b3-b814457ce281
md"
More functions for array:
- `eltype(A)`: type for units in A
- `length(A)`: numbers of units in A
- `ndims(A)`: the dimension in A
- `size(A)`: a tuple within number for each dimension
- `eachindex(A)`: a effecient iterators for accession for each units in A

More functions for generation and intialization:
- `zeros(T, dims...)`
- `ones(T, dims...)`
- `trues(dims...)`
- `falses(dims...)`
- `copy(A)`
"

# ╔═╡ 373f85d2-c91e-4053-af2f-b0ed59315a1c
md"
## tuple
some interesting examples for tuple as follows
"

# ╔═╡ f965f0fa-b4a2-43f8-8a32-08b3647cab9f
tup1 = ((1, 2), 3)

# ╔═╡ 18b6ac41-c65d-4e00-a4bb-5fd85d3fd031
# eg1: make name for tuple
begin
	names_shape = (:corner1, :corner2)
	values_shape = ((100, 100), (200, 200))
	shape_item1 = NamedTuple{names_shape}(values_shape)
	shape_item1.corner1
end

# ╔═╡ e9a77d25-23bd-4ca6-9798-ce3b547277e7
# eg2: key and value in the same tuple
shape_item2 = (corner1 = (1, 1), corner2 = (-1, -1), center = (0, 0))

# ╔═╡ de672d54-a9c0-4ba4-adb8-c0b323a58dcd
# eg3: merge two named tuple
begin
	colors_shape = (top = "red", bottom = "green")
	shape_item3 = merge(colors_shape, shape_item2)
end

# ╔═╡ f43eb0f8-1caa-4790-8908-aeb30cb5e93d
md"
## data_type
In programming languages, there are basic mathematical operations and scientific calculations, and their commonly used data types are integers and floating point numbers.

There is also a term of `literal`. Literal is used to express the notation of a fixed value in the source code. Integers, floating-point numbers, strings, etc. are all literals.

| 类型   | 带符号？ | 比特数 | 最小值    | 最大值        |
| ------ | -------- | ------ | --------- | ------------- |
| Int8   | ✓        | 8      | -2^7      | 2^7 – 1       |
| UInt8  |          | 8      | 0         | 2^8 – 1       |
| Int16  | ✓        | 16     | -2^15     | 2^15 – 1      |
| UInt16 |          | 16     | 0         | 2^16 – 1      |
| Int32  | ✓        | 32     | -2^31     | 2^31 – 1      |
| UInt32 |          | 32     | 0         | 2^32 – 1      |
| Int64  | ✓        | 64     | -2^63     | 2^63 – 1      |
| UInt64 |          | 64     | 0         | 2^64 – 1      |
| Int128 | ✓        | 128    | -2^127    | 2^127 – 1     |
| UInt128|          | 128    | 0         | 2^128 – 1     |
| Bool   | N/A      | 8      | false (0) | true (1)      |
"

# ╔═╡ 039709d7-358c-444e-a0df-c0b8d5511a67
typeof(1)

# ╔═╡ 5bd528ab-6f68-4e4c-af38-72a44e8496d9
Sys.WORD_SIZE

# ╔═╡ abd401f2-7ed5-47fa-8f02-5d6b220482e8
Int64_maxvalue = typemax(Int64)

# ╔═╡ d341fbf8-829c-4cb2-9996-979532fa164c
Int64_maxvalue + 1 == typemin(Int64)

# ╔═╡ cc7934f3-447c-4785-add2-bbc4330388be
big(10)^100

# ╔═╡ 543b4af7-d19b-4de8-88ae-e5a0fb54b785
md"
| 类型     | 精度     | 比特数 |
| -------- | -------- | ------ |
| Float16  | 半精度   | 16     |
| Float32  | 单精度   | 32     |
| Float64  | 双精度   | 64     |
"

# ╔═╡ ce12a8de-f858-4017-b658-9576ef256824
0x1p0


# ╔═╡ 48cc94c4-1000-45ba-8437-cc60da488c5a
0x1.8p3

# ╔═╡ c2a80040-c681-493f-8674-5c251cb0f536
sizeof(Float16(4.))

# ╔═╡ 39f4a752-2762-46a9-82c8-853c3d99b220
md"
**special float value**

| Float16 | Float32 | Float64 | Name  | Description                                                             |
| ------- | ------- | ------- | ----- | ----------------------------------------------------------------------- |
| Inf16   | Inf32   | Inf     | Inf   | A number greater than all finite floating-point numbers               |
| -Inf16  | -Inf32  | -Inf    | -Inf  | A number less than all finite floating-point numbers                   |
| NaN16   | NaN32   | NaN     | NaN   | A value that is not equal to any floating-point value, including itself |

"

# ╔═╡ d5bcfd25-3d6e-47c6-b98c-8b6da01426ac
1 / Inf

# ╔═╡ 1bbcd120-36f4-4531-8835-24cb025aab44
0 / 0

# ╔═╡ b84c32f6-1fa0-4a9c-b207-afbfcd5783a5
NaN > NaN

# ╔═╡ 80f559fb-026b-4285-b48b-ec0d3f5d68d6
md"
convert from one data_type to another data_type can be follow two methods.
"

# ╔═╡ 24601725-dea2-4995-9e5b-1a19f894413e
begin
	conv1 = Int64(217.0)
	conv2 = 227 % Int64
	conv3 = round(Int64, 127.54)
end

# ╔═╡ bcfa61f1-6e86-48ec-947c-59f8dd01987c
md"
## complex and rational 
For the complex, we have this form $z = a + bi$, where $i^2 = -1$, in the `Julia`, the global variable `im` is bound to `i`, we can represent the value with `im`, more examples are as follows:
"

# ╔═╡ 73d347fc-0a12-45c7-a6f5-d19574c9bf22
cp1 = (-1 + 2im)^(1 + 1im)

# ╔═╡ 138d9b34-c509-4c53-ab11-9f3be5b3b929
begin
	z = 1 + 2im
	z_real = real(z)
	z_imag = imag(z)
	z_con = conj(z)
	z_abs = abs(z)
	z_abs_sqr = abs2(z)
	z_angle = angle(z)
	z_sqrt = sqrt(z)
	z_cos = cos(z)
	z_exp = exp(z)
	z_sinh = sinh(z)
end

# ╔═╡ ef88043a-91fa-4546-b8e3-2d878f6ebe66
# generate an complex 
begin
	a = 1
	b = 2
	z_new = complex(a, b)
end

# ╔═╡ 7d0894f2-083f-4d64-a5f5-1c17f42b0dce
md"
Rational numbers are a general term for integers (positive integers, 0, negative integers) and fractions, and are a collection of integers and fractions.

Mathematically, a number that can be expressed as the ratio of two integers (, ) is defined as a rational number, for example, 0.75 (can be expressed as ). Integers and fractions are collectively called rational numbers. The opposite of rational numbers is irrational number, such as it cannot be represented by the ratio of integers.
Julia has a fraction type for representing exact ratios of integers. Scores are constructed with the `//` operator:
"

# ╔═╡ 8899b6eb-f97a-43ac-b8bf-8599c253a30b
rat1 = 5 // -15

# ╔═╡ d22194a8-d25a-41b7-87d2-db66604b0447
begin
	rat2 = -4 // -12
	rat2_num = numerator(rat2)
	rat2_deno = denominator(rat2)
end

# ╔═╡ b232ec88-4cb5-4715-b914-72ed0ff4bee6
3 // 7 < 1 // 2

# ╔═╡ 321882c4-910f-4226-a741-adb926677877
val_rat = float(rat2)

# ╔═╡ ee2c7b97-aa9c-4ca4-94cb-322ac098b553
md"
## basic operator

### arithmetic operator

| Expression | Name                | Description                                  |
| ---------- | ------------------- | -------------------------------------------- |
| +x         | Unary plus          | Returns the value unchanged                  |
| -x         | Unary minus         | Returns the negation of the value             |
| x + y      | Addition            | Returns the sum of two values                 |
| x - y      | Subtraction         | Returns the difference between two values     |
| x * y      | Multiplication      | Returns the product of two values             |
| x / y      | Division            | Returns the quotient of two values            |
| x ÷ y      | Integer division    | Returns the integer quotient of two values    |
| x \\ y     | Reverse division    | Equivalent to `y / x`                         |
| x ^ y      | Exponentiation      | Returns `x` raised to the power of `y`        |
| x % y      | Remainder (modulus) | Returns the remainder of `x` divided by `y`   |

### bool operator

| Expression | Name              |
| ---------- | -----------------|
| !x         | Negation          |
| x && y     | Short-circuit AND |
| x || y     | Short-circuit OR  |

### relational operator

| Operator | Name         |
|----------|--------------|
| ==       | Equal        |
| !=, ≠    | Not Equal    |
| <        | Less Than    |
| <=, ≤    | Less or Equal|
| >        | Greater Than |
| >=, ≥    | Greater or Equal |

### bit operator

| Expression | Name |
|------------|------|
| ~x         | Bitwise NOT |
| x & y      | Bitwise AND |
| x | y      | Bitwise OR |
| x ⊻ y      | Bitwise XOR (Logical XOR) |
| x ⊼ y      | Bitwise NAND (Negation of AND) |
| x ⊽ y      | Bitwise NOR (Negation of OR) |
| x >>> y    | Logical Right Shift |
| x >> y     | Arithmetic Right Shift |
| x << y     | Logical/Arithmetic Left Shift |

### assignment operator

All the operators are just like the same in `C++`, and for each operator, there must be a corresponding `.opt`, it means matrix operator 
"

# ╔═╡ 8cc520d0-d63b-4290-bbb6-0a1887d18526
[1, 2, 3, 5] .^ 6 .*3

# ╔═╡ b5b8e313-8eaf-42c2-bf2c-3372649f6d14
md"
## math functions
Julia provide an effecient set of standard math functions.
"

# ╔═╡ fd0af905-861d-47d0-9f2b-22dd4f94d705
isequal(NaN, NaN)

# ╔═╡ 986799b1-1537-4560-9651-ba943b6d0083
isfinite(Inf)

# ╔═╡ 76b72ef2-f9d0-47e2-9fa1-5f5d18fbd0f5
isfinite(NaN32)

# ╔═╡ ac201f8f-4da8-4582-b872-3cb9799e84fc
round(6.3)

# ╔═╡ 2cd486d1-b020-4883-8463-c714967d43d9
floor(5.7)

# ╔═╡ 5b9caa09-230d-4d08-b799-b2fba49daebd
ceil(5.7)

# ╔═╡ ace5a0d4-645a-48e5-869b-6bd12ae8176e
trunc(5.7)

# ╔═╡ 3938890c-c5e0-4ec7-b81f-4f8db5498378
trunc(-5.7)

# ╔═╡ 6040cf01-0295-46b3-bd89-373d4db29bf5
md"
### divide functions
- `div(x, y)`
- `fld(x, y)` == `div and floor`
- `cld(x, y)` == `div and ceil`
- `rem(x, y)` == `x // y`
- `mod(x, y)` == `x % y`
- `mod2pi(x)` == `x % 2pi`
- `gcd(x, y)`
- `lcm(x, y)`

### signal function
- `sign(x)`
- `copysign(x, y)` == `rv == sign(y) * abs(x)`
- `flipsign(x, y)` == `rv == sign(x * y) * abs(x)`

### math function
- `sqrt(x)`
- `expml(x)` == `x -> 0, exp(x) - 1`
- `log(x), log2(x), log10(x), log(b, x)`
- `ldexp(x, n)` == `x * 2 ^ n`
- `sin    cos    tan    cot    sec    csc sinh   cosh   tanh   coth   sech   csch asin   acos   atan   acot   asec   acsc asinh  acosh  atanh  acoth  asech  acsch sinc   cosc`
"

# ╔═╡ a8c82aff-8f32-4ebd-a08e-e936881102ee
md"
## string

Julia normally uses single quotes to create single characters, double quotes or triple quotes to create strings
"

# ╔═╡ ed2331de-b5ff-4510-bf85-15475fe6836f
'A' <= 'X' <= 'Z' 

# ╔═╡ c892e88f-5f09-499c-a20b-664a36b4091f
begin
	str = "This is shinehale notebook!"
	display(str[begin])
	display(str[1])
	
	str_sub = SubString(str, 1, 4)
	display(str_sub)

	str_merge = string(str, str_sub)
	display(str_merge)

	str_ins = "$str, $str_merge. "
	display(str_ins)

	str_cal = "1 + 2im + 10 + 6im = $(complex(1, 2) + complex(10, 6))"
	display(str_cal)
end

# ╔═╡ dc684f5a-f9a7-4e06-8696-4c90f0dcfce7
begin
	pos1 = findfirst(isequal('o'), "xylophone")
	pos2 = findlast(isequal('o'), "xylophone")
	display(pos1)
	display(pos2)
	occursin('o', "Xylophon")
end 

# ╔═╡ f40e0d40-846f-4391-9fab-338f0fc9a230
md"
More functions about the string
- firstindex(str)
- lastindex(str) 
- length(str) 
- length(str, i, j) 
- ncodeunits(str) 
- codeunit(str, i) 
- thisind(str, i) 。
- nextind(str, i, n=1) 
- prevind(str, i, n=1)
"

# ╔═╡ 2faba2aa-aaae-46da-a5f8-1b5298576abb
md"
## regular expression

A regular expression describes a string matching pattern, which can be used to check whether a string contains a certain substring, replace the matched substring, or extract a substring that meets a certain condition from a string wait.
"

# ╔═╡ d20d1c40-0154-4299-b20d-a4923ba4077c
begin
	re = r"^\s*(?:#|$)"
	occursin(re, "not a comment")
end

# ╔═╡ 353bb074-62d2-4da4-a69e-3d3f1ca43b16
begin
	line = "not a comment"
	m = match(r"^\s*(?:#|$)", line)
	if m === nothing
    	println("not a comment")
	else
    	println("blank or comment")
	end
end

# ╔═╡ d3e3f5c0-cc6d-4c65-8316-90fee39d7d72
md"
## functions
A function is a group of statements that together perform a task.

In Julia, a function is an object that maps a tuple of argument values to a return value.

Functions are defined using function in Julia. The basic syntax is:

```
function functionname(args)
   expression
   expression
   expression
   ...
   expression
end
```
"

# ╔═╡ 5f6b2c6c-2e64-4c15-a7ee-81d87ed0ee0c
function add(x, y)
	return x + y
end

# ╔═╡ da5ffb0c-0dcf-4965-981f-3b3c236d08d6
add(5, 6)

# ╔═╡ 4a6bfb6f-7c80-4d90-8a8f-2709f84f9435
function RSA(x, y)::float64
	return sqrt(x^2 + y^2)
end

# ╔═╡ c75af3e0-afa5-4b1a-993b-0437e8e337f1
function pos(ax, by, cz = 0)
	println("$ax, $by, $cz")
end

# ╔═╡ f90ab000-6b0e-44d4-afd0-0805e712497b
pos(5, 6)

# ╔═╡ a5a7e29a-f664-454e-8235-46d5d918f95e
func = x -> x^2 + 2x -1 

# ╔═╡ 5f3b179f-6782-4908-b9ee-325b897e6a49
lis = map(func, [k for k in 1:10])

# ╔═╡ 4d7c2794-14d7-4bd3-9438-c90a10657a4b
function add_gen(x)
	Y = x * 2
	function add1(Y)
		Y += 1
	end
	add1(Y)
end

# ╔═╡ 2635fd72-aba3-473f-9980-41a68ea66f8b
fib(x) = x < 2 ? x : fib(x-1) + fib(x-2)

# ╔═╡ 10df1eca-6057-4a90-918d-2ba2df4e749a
fib(10)

# ╔═╡ c5cd1d68-9508-428b-8ba6-0492492f8c70
md"
## process control
"

# ╔═╡ db246833-78b8-4ea8-8ea8-28a1c7a91321
val_tot = begin val1 = 1;val2 = 1;val1 + val2 end

# ╔═╡ 279f120b-588b-4a64-8693-13a72d5b2854
if val1 < val2
    println("x is less than y")
elseif val1 > val2
    println("x is greater than y")
else
    println("x is equal to y")
end

# ╔═╡ 54db9b11-3ba2-485b-99d0-854331779452
begin
	i = 1;
	while i <= 5
		println(i)
		i += 1
	end
end

# ╔═╡ 317f7362-a0d8-404e-90c1-ecfbbb4d10f6
for i = 1:5
	println(i)
end

# ╔═╡ 1eeb120e-dc48-4fba-bd94-f680eb6dd9e1
for s in ["hale", "shinehale", "test"]
	println(s)
end

# ╔═╡ 0628a331-50b1-422b-aa71-e1d825875b24
for j = 1:1000
    println(j)
    if j >= 5
        break
    end
end

# ╔═╡ c259940c-9ecc-408d-bb20-8d47462ea044
for x in zip(0:15, 100:110, 200:210)
    println(x)
end

# ╔═╡ 81924c7e-0ac1-4628-9373-64a00ff326a4
md"
## dictionary and set
"

# ╔═╡ c7bdef66-35ea-4335-b9cb-ad0df8a5fbcc
D = Dict("A"=>1, "B"=>2)

# ╔═╡ 8452ceb0-46cd-432e-beec-28a646554c4d
first_dict = Dict(string(x) => sind(x) for x = 0:5:360)

# ╔═╡ 109505b7-290b-4e6d-ada4-708b3b7e1383
haskey(first_dict, "A")

# ╔═╡ b4d649f0-a15b-4277-aa2d-5ac48b2cd146
in(("A" => 1), D)

# ╔═╡ 5059081a-01ad-4c52-a33b-05564f0473db
delete!(D, "C")

# ╔═╡ 2d9d3c71-9e5e-488a-974e-2cffb1fdf053
keys(D)

# ╔═╡ fdcc916f-56d0-4a23-aeb4-cd73d3373d08
values(D)

# ╔═╡ b965c610-16ce-4afc-a6e1-c95ea5cba3a2
for kv in D
	println(kv)
end  

# ╔═╡ 66fd239a-9f93-445a-84c5-25b7d6ee2b9e
hale_dict = DataStructures.SortedDict("S" => 220, "T" => 350, "U" => 400, "V" => 575, "W" => 670)

# ╔═╡ a10ec7ae-ab91-421f-bd0a-fe38e69e008f
 var_site = Set{String}(["Google","Runoob","Taobao"])

# ╔═╡ bc76af61-9ac2-4242-aca3-2d116a0b1d54
push!(var_site, "Wiki")

# ╔═╡ 6f60ca96-9d68-48c3-bd11-4e8f854c4615
in("Zhihu", var_site)

# ╔═╡ fe093da0-23bf-461a-a356-6e4790235b1d
 begin
	 A = Set{String}(["red","green","blue", "black"])
	 B = Set{String}(["red","orange","yellow","green","blue","indigo","violet"])
	 union(A, B)
	 intersect(A, B)
	 setdiff(A, B)
 end

# ╔═╡ 1f97a4c8-a262-47f1-b9d2-a8c78d9d528a
begin
	dict1 = Dict(100=>"X", 220 => "Y")
	dict2 = Dict(220 => "Y", 300 => "Z", 450 => "W")
	union(dict1, dict2)
	intersect(dict1, dict2)
	setdiff(dict1, dict2)
	merge(dict1, dict2)
	findmin(dict1)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataStructures = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"

[compat]
DataStructures = "~0.18.13"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "94b5f2f7240c1d4a3c57271fa0c48cc356714096"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "d321bf2de576bf25ec4d3e4360faca399afca282"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╟─bebefcbe-df87-11ed-3325-81e1b955e105
# ╟─87dd33fe-017f-4b45-ad1d-b45bc4f76c00
# ╠═9139b424-0184-4f25-974d-fdb50d20c21c
# ╟─ec4649d9-40dc-41a3-af33-dfb7ceb052c5
# ╠═098e1b1e-d498-44b4-b8da-90c8549b68b1
# ╠═7c6570b2-ab24-4c3f-9f8d-49add9dfbd62
# ╠═46454e3b-dd8f-440e-a125-a43d483995a0
# ╠═628c67d4-ae81-4367-a038-56fd9b77a5a7
# ╠═1b87c96e-0e61-4047-8825-c66af1ac4feb
# ╠═59a9c7a9-e766-4bd5-85a4-2e0a87b6b0fa
# ╠═f773f7fe-ef78-4a7b-945c-4db4bd24aa39
# ╠═1022cdfe-ff05-4462-976f-8f50e899cc3f
# ╠═02376a58-38b3-4b48-be06-935d4a11ab0e
# ╠═6cb9c653-2fda-4802-b5a2-7d46e8fa8abd
# ╠═a7feb420-e843-4f00-ad5d-ac4f4a913187
# ╠═fc7db3ce-ca01-499b-aab5-43c999a64779
# ╠═b9bb28d6-1f94-4721-ba61-c19f74f7b08d
# ╠═5e0567e8-de6c-402d-96a6-8d65ec33f831
# ╟─c2559bab-a6c3-4795-b6b3-b814457ce281
# ╟─373f85d2-c91e-4053-af2f-b0ed59315a1c
# ╠═f965f0fa-b4a2-43f8-8a32-08b3647cab9f
# ╠═18b6ac41-c65d-4e00-a4bb-5fd85d3fd031
# ╠═e9a77d25-23bd-4ca6-9798-ce3b547277e7
# ╠═de672d54-a9c0-4ba4-adb8-c0b323a58dcd
# ╟─f43eb0f8-1caa-4790-8908-aeb30cb5e93d
# ╠═039709d7-358c-444e-a0df-c0b8d5511a67
# ╠═5bd528ab-6f68-4e4c-af38-72a44e8496d9
# ╠═abd401f2-7ed5-47fa-8f02-5d6b220482e8
# ╠═d341fbf8-829c-4cb2-9996-979532fa164c
# ╠═cc7934f3-447c-4785-add2-bbc4330388be
# ╟─543b4af7-d19b-4de8-88ae-e5a0fb54b785
# ╠═ce12a8de-f858-4017-b658-9576ef256824
# ╠═48cc94c4-1000-45ba-8437-cc60da488c5a
# ╠═c2a80040-c681-493f-8674-5c251cb0f536
# ╟─39f4a752-2762-46a9-82c8-853c3d99b220
# ╠═d5bcfd25-3d6e-47c6-b98c-8b6da01426ac
# ╠═1bbcd120-36f4-4531-8835-24cb025aab44
# ╠═b84c32f6-1fa0-4a9c-b207-afbfcd5783a5
# ╠═80f559fb-026b-4285-b48b-ec0d3f5d68d6
# ╠═24601725-dea2-4995-9e5b-1a19f894413e
# ╟─bcfa61f1-6e86-48ec-947c-59f8dd01987c
# ╠═73d347fc-0a12-45c7-a6f5-d19574c9bf22
# ╠═138d9b34-c509-4c53-ab11-9f3be5b3b929
# ╠═ef88043a-91fa-4546-b8e3-2d878f6ebe66
# ╟─7d0894f2-083f-4d64-a5f5-1c17f42b0dce
# ╠═8899b6eb-f97a-43ac-b8bf-8599c253a30b
# ╠═d22194a8-d25a-41b7-87d2-db66604b0447
# ╠═b232ec88-4cb5-4715-b914-72ed0ff4bee6
# ╠═321882c4-910f-4226-a741-adb926677877
# ╟─ee2c7b97-aa9c-4ca4-94cb-322ac098b553
# ╠═8cc520d0-d63b-4290-bbb6-0a1887d18526
# ╠═b5b8e313-8eaf-42c2-bf2c-3372649f6d14
# ╠═fd0af905-861d-47d0-9f2b-22dd4f94d705
# ╠═986799b1-1537-4560-9651-ba943b6d0083
# ╠═76b72ef2-f9d0-47e2-9fa1-5f5d18fbd0f5
# ╠═ac201f8f-4da8-4582-b872-3cb9799e84fc
# ╠═2cd486d1-b020-4883-8463-c714967d43d9
# ╠═5b9caa09-230d-4d08-b799-b2fba49daebd
# ╠═ace5a0d4-645a-48e5-869b-6bd12ae8176e
# ╠═3938890c-c5e0-4ec7-b81f-4f8db5498378
# ╟─6040cf01-0295-46b3-bd89-373d4db29bf5
# ╠═a8c82aff-8f32-4ebd-a08e-e936881102ee
# ╠═ed2331de-b5ff-4510-bf85-15475fe6836f
# ╠═c892e88f-5f09-499c-a20b-664a36b4091f
# ╠═dc684f5a-f9a7-4e06-8696-4c90f0dcfce7
# ╟─f40e0d40-846f-4391-9fab-338f0fc9a230
# ╠═2faba2aa-aaae-46da-a5f8-1b5298576abb
# ╠═d20d1c40-0154-4299-b20d-a4923ba4077c
# ╠═353bb074-62d2-4da4-a69e-3d3f1ca43b16
# ╠═d3e3f5c0-cc6d-4c65-8316-90fee39d7d72
# ╠═5f6b2c6c-2e64-4c15-a7ee-81d87ed0ee0c
# ╠═da5ffb0c-0dcf-4965-981f-3b3c236d08d6
# ╠═4a6bfb6f-7c80-4d90-8a8f-2709f84f9435
# ╠═c75af3e0-afa5-4b1a-993b-0437e8e337f1
# ╠═f90ab000-6b0e-44d4-afd0-0805e712497b
# ╠═a5a7e29a-f664-454e-8235-46d5d918f95e
# ╠═5f3b179f-6782-4908-b9ee-325b897e6a49
# ╠═4d7c2794-14d7-4bd3-9438-c90a10657a4b
# ╠═2635fd72-aba3-473f-9980-41a68ea66f8b
# ╠═10df1eca-6057-4a90-918d-2ba2df4e749a
# ╟─c5cd1d68-9508-428b-8ba6-0492492f8c70
# ╠═db246833-78b8-4ea8-8ea8-28a1c7a91321
# ╠═279f120b-588b-4a64-8693-13a72d5b2854
# ╠═54db9b11-3ba2-485b-99d0-854331779452
# ╠═317f7362-a0d8-404e-90c1-ecfbbb4d10f6
# ╠═1eeb120e-dc48-4fba-bd94-f680eb6dd9e1
# ╠═0628a331-50b1-422b-aa71-e1d825875b24
# ╠═c259940c-9ecc-408d-bb20-8d47462ea044
# ╟─81924c7e-0ac1-4628-9373-64a00ff326a4
# ╠═c7bdef66-35ea-4335-b9cb-ad0df8a5fbcc
# ╠═8452ceb0-46cd-432e-beec-28a646554c4d
# ╠═109505b7-290b-4e6d-ada4-708b3b7e1383
# ╠═b4d649f0-a15b-4277-aa2d-5ac48b2cd146
# ╠═5059081a-01ad-4c52-a33b-05564f0473db
# ╠═2d9d3c71-9e5e-488a-974e-2cffb1fdf053
# ╠═fdcc916f-56d0-4a23-aeb4-cd73d3373d08
# ╠═b965c610-16ce-4afc-a6e1-c95ea5cba3a2
# ╠═3322ec6e-cd2b-41bb-9333-177d0e142b53
# ╠═66fd239a-9f93-445a-84c5-25b7d6ee2b9e
# ╠═a10ec7ae-ab91-421f-bd0a-fe38e69e008f
# ╠═bc76af61-9ac2-4242-aca3-2d116a0b1d54
# ╠═6f60ca96-9d68-48c3-bd11-4e8f854c4615
# ╠═fe093da0-23bf-461a-a356-6e4790235b1d
# ╠═1f97a4c8-a262-47f1-b9d2-a8c78d9d528a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
