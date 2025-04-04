/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#pragma once

#include "velox/exec/ExchangeQueue.h"
#include "velox/exec/OutputBufferManager.h"
#include "velox/vector/ComplexVector.h"
// #include "velox/vector/VectorStream.h"

namespace facebook::velox::exec::test {

/// Helper function for serializing RowVector to PrestoPage format.
std::unique_ptr<SerializedPage> toSerializedPage(
    const RowVectorPtr& vector,
    VectorSerde::Kind serdeKind,
    const std::shared_ptr<OutputBufferManager>& bufferManager,
    memory::MemoryPool* pool);

} // namespace facebook::velox::exec::test
