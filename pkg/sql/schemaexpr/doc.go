// Copyright 2020 The Cockroach Authors.
//
// Use of this software is governed by the Business Source License
// included in the file licenses/BSL.txt.
//
// As of the Change Date specified in that file, in accordance with
// the Business Source License, use of this software will be governed
// by the Apache License, Version 2.0, included in the file
// licenses/APL.txt.

/*
Package schemaexpr provides utilities for dealing with expressions with table
schemas, such as check constraints, computed columns, and partial index
predicates. It provides the following utilities.

CheckConstraintBuilder

  Validates and builds sql.TableDescriptor_CheckConstraints from
  tree.CheckConstraintTableDefs.

ComputedColumnValidator

  Validates computed columns and can determine if a non-computed column has
  dependent computed columns.

PartialIndexValidator

  Validates partial index predicates and dequalifies the columns referenced.

DequalifyColumnRefs

  Strips database and table names from qualified columns.

*/
package schemaexpr
