
#Pair up the smallest number in the left list with the smallest number in the right list, then the second-smallest left number with the second-smallest right number, and so on.
#Within each pair, figure out how far apart the two numbers are; you'll need to add up all of those distances. For example, if you pair up a 3 from the left list with a 7 from the right list, the distance apart is 4; if you pair up a 9 with a 3, the distance apart is 6.

$input = Get-Content -Path .\input.txt

$left = @()
$right = @()

$input | foreach {
    $left += $_.split("   ")[0]
    $right += $_.split("   ")[1]
}

$left = $left | Sort-Object
$right = $right | Sort-Object

$distance = 0
for ($i = 0; $i -lt $left.Count; $i++) {
    $distance += [Math]::Abs($left[$i] - $right[$i])
}

Write-Host "Part 1: $($distance)"

## part 2
#This time, you'll need to figure out exactly how often each number from the left list appears in the right list. Calculate a total similarity score by adding up each number in the left list after multiplying it by the number of times that number appears in the right list.
$pt2 = 0
$left | foreach {
    $value = [int]$_ * ($right -eq $_).Count
    $pt2 += $value
}

Write-Host "Part 2: $($pt2)"