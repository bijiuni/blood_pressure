# Developing an Algorithm to Determine Arterial Indexes like SP, DP, MAP

SP: systolic pressure (maximum during one heart beat)
DP: diastolic pressure (minimum in between two heart beats) 
MAP: The mean arterial pressure (MAP)
Usually = CO* SVR

How to derive arterial indexed from cuff pressure curve? Multiple methods exist on market for different companies.
Here we implement one of the methods which makes use of cuff pressure oscillation.


## Running the tests

Seven parts of the program with sample code:

1. The program load the data
2. Plot the rawdata for comparison
3. Extract baseline and filter the raw data

```
baseline = sgolayfilt(Rawdata,4,2301);
filtered = Rawdata - baseline;
```

4. Plot filtered signal and its envelope
5. Find the max and min of the envelop

```
[maxv, maxi] = max(diffe);
hold on
plot(maxi,maxv, 'o');
diffe(1:maxi) = 500;
[minv, mini] = min(diffe);
hold on
```

6. Find where the maximal oscillation occurs

```
for i = 1:length(Rawdata)
temp = filtered(i);
if(temp>max && abs(prior-temp)<0.5)
max = temp;
index = i;
end
prior = temp;
end
```

7. Print out SP and DP with assumed ratios


## Deployment

We assumed that MAP occurs when cuff
pressure oscillation reaches its maximum. SP occurs when differentiated envelope reaches its
maximum and DP occurs when differentiated envelop reaches its minimum.

Multiple methods are currently used by different companies on the market, whether this method produces the optimal results
requires further clinical investigation.



## Authors

* **Zach Lyu (Software Part)** - [bijiuni](https://github.com/bijiuni)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Other group mates: Cheung Evelyn Hok Yee; Chong Pui Ka; Lee Wing Yan
