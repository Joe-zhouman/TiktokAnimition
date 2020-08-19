# 绘制三维曲面
## 1. 生成采样格点xq, yq
```matlab
  xRange = linspace(xlo, xhi, xSamples);
  yRange = linspace(ylo, yhi, ySamples);
  [xq, yq] = meshgrid(xRange, yRange);
```
## 2. 生成插值数据集zq
* 使用 `griddata`
```matlab
  zq = griddata(x, y, z, xq, yq);
```
* 使用 `scatteredInterpolant`
```matlab
F = scatteredInterpolant(x, y, z);
zq = F(xq, yq);
```
**注意：**
1. 数据点较多时使用`scatteredInterpolant`**速度更快**
2. `scatteredInterpolant` 里的`x, y, z` 参数要为**列向量**

## 3. 绘制曲面
* `mesh`绘制网格图，`surf`绘制表面图
```matlab
mesh(xq, yq, zq);
```
```matlab
surf(xq, yq, zq);
```
