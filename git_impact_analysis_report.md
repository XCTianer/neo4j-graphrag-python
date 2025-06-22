# Git变更影响范围分析报告

**生成时间**: 2025-06-22 14:30:12
**分析提交数**: 3

---

## 提交 1: f2bc4089 - 导出当前Neo4j数据库数据，包含节点、关系、统计信息和重建Cypher脚本

**提交信息**:
- 哈希: f2bc40899a0a6be8e7a7835bbc2633c83574e7d5
- 作者: xiechitian
- 时间: 2025-06-22
- 消息: 导出当前Neo4j数据库数据，包含节点、关系、统计信息和重建Cypher脚本

**变更概述**:
- 修改文件: 0 个
- 变更变量: 59 个
- 变更函数: 181 个
- 变更脚本: 0 个

**变更变量**: out, mdl, summary, X, Y, predictions, z, varargout, Z, params, parameters, dirpath, supportfileName, names, weightsStruct, name, types, xsz, filePath, this, tokens, x, text, tok, u, tf, vocab, toks, idx, y, A, W, SharedTestFixtures, validText, constraint, tol, s, w, a, ids, vocabFiles, modelNames, japaneseBERTTokenizer, inferTypeID, path, modelDirs, pasts, weights, modelName, modelPath, parameter, c, newParameters, numericTokens, word, cs, pairs, sample, logits

**变更函数**: out, mdl, summary, iIsScalarString, X, Y, predictions, z, varargout, mustBeLessThanOrEqualNumLayers, mustBeALogicalOrDlarrayLogical, mustBeNumericDlarray, params, dirpath, supportfileName, names, weightsStruct, name, types, filePath, is, this, tokens, x, text, tok, u, tf, vocab, mustBeFileOrEncoding, toks, idx, y, Z, A, W, canConstructModelWithDefault, canConstructModelWithNVP, canConstructLanguageModel, verifyOutputDimSizes, maskTokenIsRemoved, inputWithoutMASKRemainsTheSame, validText, canConstructAllModels, canConstructModelWithNVPAndVerifyDefault, checkBertIgnoreCase, multicasedVersionIsCaseSensitive, canDoNSP, constraint, matchesExpectedValue, supportsMultipleTypes, tol, hasExpectedValue, s, resetGlobalSeed, doesDropout, isRandom, supportsDlarrayAndAutodiff, returnsValueWhenOneKey, isScaledDotProduct, isExpectedValue, multipleQueries, multipleHeads, defaultIsMasked, canTurnOffMask, canDropout, defaultIsNoDropout, multipleObservations, w, a, verifyDlarrayEqual, computesExpectedValue, checkSingleHeadNoFullyConnected, checkMultiHeadNoFullyConnected, checkPastPresentCaching, checkInputOutputFC, defaultIsMaksed, canBatch, canEncodeSentencePairs, checkDuplicateSentence, defaultOutputsIsLastLayer, outputsCanBeUsed, outputsCanDuplicateAndBeOutOfOrder, negativeTestOutputs, negativeTestSeparatorCode, negativeTestPaddingCode, negativeTestDropoutProb, negativeTestAttentionDropoutProb, negativeInputMask, negativeInputX, negativeModelParameters, errorsForIncorrectModelName, canUseInputMask, ids, canPredictMaskedTokens, checkProbDistrOverChannelDimBatches, canConstruct, canConstructWithNonDefaultModel, hasExpectedProperties, canEncodeOneSentence, canEncodeMultipleSentences, canEncodeSentencePair, canEncodeMultipleSentencePairs, errorsForDifferentNumberOfSentencePairObservations, canDecode, canDecodeMultipleObservations, canDecodePaddedBatch, canIgnoreCase, checkCaseSensitivity, vocabFiles, matchesExpectedEncoding, modelNames, japaneseBERTTokenizer, canTokenize, canTokenizeBatch, removesControlCharactersAndWhitespace, splitsOnNewlines, tokenizesCJK, splitsOnPunctuation, stripsAccents, canBeCaseSensitive, matchesExpectedTokenization, errorsIfBasicTokenizerIsNotTokenizer, canSetBasicTokenizer, canConstructWithFile, canSetUnknownToken, canSetMaxTokenLength, hasExpectedVocabSize, tokenizationMatchesTokenizedDocument, canSetOptions, oneObsOneSeparator, oneObsOneSeparatorWithPadding, oneObsTwoSeparators, oneObsTwoSeparatorsEdgeCase, oneObsTwoSeparatorsPadded, batchedCase, canUseSentimentAnalysisModel, languageModelErrorsWithSAParams, canSampleDeterministic, canSampleUniform, testForKIsOne, testForLargeK, dlarrayIsSupported, setup, teardown, path, modelDirs, loadParameters, verifyLoadStructFields, verifyHyperparameters, verifyWeights, canUseModel, canAcceptBatches, pasts, parameters, verifyFilesExist, outputHasInputSize, outputHasInputSizeWithPasts, weights, encodeGivesCorrectResults, decodeGivesCorrectResults, testTokenization, byteEncoderSize, independenceOfInputClass, commentNotInBPE, decodeInvertsEncode, setupEncoder, modelName, modelPath, parameter, c, newParameters, download, iCreateDirectoryIfItDoesNotExist, iDownloadFileIfItDoesNotExist, numericTokens, word, cs, pairs, sample, logits

**GraphRAG影响分析**:
分析失败: 'GraphRAG' object has no attribute 'generate'

---

## 提交 2: 26753813 - feat: 添加GraphRAG版本的MATLAB代码影响分析系统

**提交信息**:
- 哈希: 26753813f539af6511d1cfa5e7d021375302cbca
- 作者: xiechitian
- 时间: 2025-06-22
- 消息: feat: 添加GraphRAG版本的MATLAB代码影响分析系统

**变更概述**:
- 修改文件: 0 个
- 变更变量: 78 个
- 变更函数: 1 个
- 变更脚本: 0 个

**变更变量**: query, result, records, query_text, return_context, chinese_report, comprehensive_result, driver, llm, matlab_query_templates, schema, retriever, graphrag, query_templates, analyzer, git_diff, analysis_result, recent_analysis, staged_analysis, working_analysis, analysis, python, model_name, model_params, auth, str, repo_path, cmd, int, pretty, commits, parts, history, current_branch, remote_branches, git, neo4j_schema, neo4j_database, impact_analysis_template, system_instructions, template, prompt_template, labels, types, schema_info, record, changes, lines, current_file, var_match, var_name, func_match, func_name, queries, bool, 使用GraphRAG分析Git变更影响范围, analysis_results, comprehensive_query, all_analyses, diff, encoding, comp_analysis, 影响范围分析系统, branch_info, all_changes, combined_diff, __name__, 测试GraphRAG核心组件, test_query, n, staged_diff, working_diff, test_git_diff, multiplier, test_results, status, passed_tests, total_tests

**变更函数**: result

**GraphRAG影响分析**:
分析失败: 'GraphRAG' object has no attribute 'generate'

---

## 提交 3: dffd484e - Fix VertexAILLM (#342)

**提交信息**:
- 哈希: dffd484e8a84a64584a337eff9a5d3d9eda2864d
- 作者: Estelle Scifo
- 时间: 2025-06-16
- 消息: Fix VertexAILLM (#342)

**变更概述**:
- 修改文件: 0 个
- 变更变量: 35 个
- 变更函数: 1 个
- 变更脚本: 0 个

**变更变量**: parameters, person_tool_parameters, execute_func, company_tool_parameters, description, properties, required_properties, additional_properties, company_info_tool, name, TOOLS, model_name, tool_config, function_calling_config, mode, allowed_function_names, text, text1, input, system_message, model, system_instruction, messages, response, content, options, function_declarations, vertex_ai_tools, tools, user_message, last_call, return_value, contents, res, calls

**变更函数**: that

**GraphRAG影响分析**:
分析失败: 'GraphRAG' object has no attribute 'generate'

---

