function mdl = my_fitpca(D,class)
    class_labels = unique(class);
    numclasses = length(class_labels);
    
    for i = 1 : numclasses
        [eigvects, ~, eigvals, ~,~,mu] = pca(D(class == class_labels(i),:));
        mdl.class(i).eigvects = eigvects';
        mdl.class(i).eigvals = eigvals;
        mdl.class(i).mu = mu;
    end
end