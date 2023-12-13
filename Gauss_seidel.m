load A.txt
load B.txt

% Steps
% 1. Declare/Initialize Variables 
% 2. Iterate using the Gauss-Seidel Method until the error is reached 
% 3. Iterate through each target error to find out how many iterations it takes
% 4. Print out values for # of iterations and solutions

% Gauss-Seidel Iterations
targets = [0.01, 0.001, 0.0001];
n_targets = length(targets);
iterations = zeros(n_targets, 1);

n = length(B);

% Iterates through the target errors, 
for j = 1:n_targets
    target = targets(j);
    isLess = false;
    iters = 0;
    x = zeros(n, 1);
    
    % Iteratates until it reaches the target approximate relative error
    while ~isLess
        iters = iters + 1;
        prev = x;

        for i = 1:n
            sum = B(i);
            for k = 1:n
                if k ~= i
                    sum = sum - A(i,k)*x(k); % Moves everything to the other side and plugs in the previous x values 
                end
            end
            x(i) = sum / A(i,i); % Divide by the unknown x coefficient to solve for x
        end

        are = norm(abs((x - prev) / x)); % Calculate approximate relative error

        if are < target
            isLess = true; % Break the loop if the target error is reached
        end
    end
    
    if targets(j) == 0.01
       disp("1% Error Calculations:")
    end
    
    if targets(j) == 0.001
       disp("0.1% Error Calculations:")
    end
    
    if targets(j) == 0.0001
       disp("0.01% Error Calculations:")
    end
    
    disp(x)
    iterations(j) = iters;
end

disp("Total number of Iterations for 1%:") 
disp(iterations(1))

disp("Total number of Iterations for 0.1%:") 
disp(iterations(2))

disp("Total number of Iterations for 0.01%:") 
disp(iterations(3))
