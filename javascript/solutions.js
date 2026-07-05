// =========================================
// LeetCode Solutions — JavaScript
// Profile: https://leetcode.com/u/b0gomol4/
// Author: Elvin Abbaszade
// =========================================

// Task 1: Two Sum (#1)
// https://leetcode.com/problems/two-sum/
var twoSum = function(nums, target) {
    let map = {}
    
    for (let i = 0; i < nums.length; i++) {
        let complement = target - nums[i]
        
        if (complement in map) {
            return [map[complement], i]
        }
        
        map[nums[i]] = i
    }
}

// Task 2: Palindrome Number (#9)
// https://leetcode.com/problems/palindrome-number/
var isPalindrome = function(x) {
    return x == String(x).split('').reverse().join('')
}

// Task 3: Roman to Integer (#13)
// https://leetcode.com/problems/roman-to-integer/
var romanToInt = function(s) {
    let map = {
        'I': 1, 'V': 5, 'X': 10,
        'L': 50, 'C': 100, 'D': 500, 'M': 1000
    }
    
    let result = 0
    
    for (let i = 0; i < s.length; i++) {
        let current = map[s[i]]
        let next = map[s[i + 1]]
        
        if (current >= next || next == undefined) {
            result += current 
        }
        else if (current < next) {
            result -= current
        }
    }
    
    return result
}

// Task 4: Repeated Substring Pattern (#459)
// https://leetcode.com/problems/repeated-substring-pattern/
var repeatedSubstringPattern = function(s) {
    return (s + s).slice(1, -1).includes(s)
}

// Task 5: Number Complement (#476)
// https://leetcode.com/problems/number-complement/description/
var findComplement = function(num) {
    let binary = num.toString(2).split('')
    let binaryReplace = ''

    for (let i = 0; i < binary.length; i++) {
        if (binary[i] == 1) {
            binaryReplace += '0'
        } 
        else {
            binaryReplace += '1'
        }  
    }

    return parseInt(binaryReplace, 2)
};
