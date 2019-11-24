---
title: The Magic of Quake 3's Fast Inverse Square Root Explained
date: 2019-11-24T17:24:58-05:00
draft: false
description: The Magic of Quake 3's Fast Inverse Square Root Explained
keywords: quake3, math, tutorial, blog
url: /posts/quake3-fast-inverse-square-root/
customJS:
  - https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML
toc: false
images:
tags:
  - quake3
  - math
  - tutorial
  - blog
---

This is one of those magical unicorn algorithms.

I was always intrigued by this small piece of code, because it's such a unique and elegant solution to a common problem, and it's part of a game I played a lot as a kid. I did not understand it then, but I do now.

This algorithm estimates the inverse square root, \\( 1 / \sqrt{number} \\), of a positive 32 bit floating point number.

Nowadays programmers might think to solve this problem by simply importing a library and calling a function.

But back in 1999 the Quake 3 Arena developers realized it was computationally expensive to calculate the inverse square root of a floating point number on a large scale using traditional methods.

One ninja developer came up with a solution that bypassed this limitation, and the [Fast inverse square root algorithm](https://en.wikipedia.org/wiki/Fast_inverse_square_root) was born.

```c
float Q_rsqrt( float number )
{
    long i;
    float x2, y;
    const float threehalfs = 1.5F;

    x2 = number * 0.5F;
    y  = number;
    i  = * ( long * ) &y;                       // evil floating point bit level hacking
    i  = 0x5f3759df - ( i >> 1 );               // what the fuck? 
    y  = * ( float * ) &i;
    y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
//  y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed
    return y;
}
```

The function makes use of [Newton’s method](https://en.wikipedia.org/wiki/Newton%27s_method). Newton’s method is used for finding better approximations to the roots of a mathematical function.

It looks like this:

$$ x\_{1} = x\_{0} - \\frac{f(x\_{0})}{f'(x\_{0})} $$

\\( x\_{0} \\) is an initial approximation, and the formula generates \\( x\_{1} \\) which is an even better approximation. The more iterations you perform, the better the approximation.

If we want to find the value of \\( 1 / \sqrt{number} \\), we are looking for a solution to the equation \\( f(x) = x^{-2} - number \\). Take your best guess as to what the solution would be, and call it \\( x\_{0} \\). We are only interested in the positive solution.

We now know that \\( f(x\_{0}) \\) is \\( x\_{0}^{-2} - number \\). For clarification, **number** is the number which we want to find the inverse square root for, the input parameter to our C function above.

Our Newton method now becomes:

$$ x\_{1} = x\_{0} - \frac{x\_{0}^{-2} - number}{-2 x\_{0}^{-3}} $$

After some algebraic magic (feel free to compute the result yourself), our equation becomes:

$$ x\_{1} = x\_{0}(\frac{3}{2} - \frac{1}{2} * x\_{0}^{2} * number) $$

This is similar to line 12 in the C code.

```c
y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
```

Remember when I asked you to guess the first approximation, \\( x_{0} \\)? Well, how do we get the value for it?

Simple answer… magic.

To quote Gary Tarolli, who (very modestly) takes partial credit for writing the function:

> Which actually is doing a floating point computation in integer - it took a long time to figure out how and why this works, and I can't remember the details anymore.

It is not known how the exact value of the magic number **0x5f3759df** was determined.  
What is known is that, if we take our input number and divide it by 2 ([shift it to the right by 1](https://en.wikipedia.org/wiki/Bitwise_operations_in_C#Right_shift_%3E%3E)), and then subtract this number from the magic number, we get a really good first estimate.

To note, the input number is a `float`. In order to divide by 2 by shifting the bits to the right, it is converted into a `long` integer. Then it is converted back into a `float`.

```c
i  = * ( long * ) &y;                       // evil floating point bit level hacking
i  = 0x5f3759df - ( i >> 1 );               // what the fuck? 
y  = * ( float * ) &i;
```

This estimate, which is \\( x_{0} \\) in our mathematical function above, is then used in calculating the next approximation. The result is so close to the desired value, that a second iteration is not even needed anymore, as denoted by the commented code on line 13.

```c
    y  = y * ( threehalfs - ( x2 * y * y ) );   // 1st iteration
//  y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed
```

You can read more about the Fast inverse square root [here](https://www.beyond3d.com/content/articles/8) and [here](https://www.beyond3d.com/content/articles/15).
