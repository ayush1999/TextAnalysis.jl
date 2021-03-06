module TestNGramizer
    using Base.Test
    using Languages
    using TextAnalysis
    using Compat

    sample_text = "this is some sample text"
    tkns = TextAnalysis.tokenize(Languages.English(), sample_text)
    ngs = TextAnalysis.ngramize(Languages.English(), tkns, 1)
    @assert isequal(ngs, Dict{String,Int}("some" => 1,
    	                                     "this" => 1,
    	                                     "is" => 1,
    	                                     "sample" => 1,
    	                                     "text" => 1))
    ngs = TextAnalysis.ngramize(Languages.English(), tkns, 2)
    @assert isequal(ngs, Dict{String,Int}("some" => 1,
                                             "this is" => 1,
                                             "some sample" => 1,
                                             "is some" => 1,
                                             "sample text" => 1,
                                             "this" => 1,
                                             "is" => 1,
                                             "sample" => 1,
                                             "text" => 1))
end
