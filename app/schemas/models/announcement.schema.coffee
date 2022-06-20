c = require './../schemas'


MongoQueryOperatorSchema =
  title: 'Query Operator'
  type: 'object'
  properties:
    '$gt': type: 'number'
    '$gte': type: 'number'
    '$in': type: 'array'
    '$lt': type: 'number'
    '$lte': type: 'number'
    '$ne': type: ['number', 'string']
    '$nin': type: 'array'
    '$exists': type: 'boolean'
  additionalProperties: false

MongoFindQuerySchema =
  title: 'Query'
  type: 'object'
  patternProperties:
    '^[-a-zA-Z0-9._]*$':
      anyOf: [
        {$ref: '#/definitions/mongoQueryOperator'},
        {type: 'string'}
        {type: 'object'}
        {type: 'boolean'}
      ]
  properties: {}
  additionalProperties: false
  definitions: {}


AnnouncementSchema = c.object
  title: 'Announcement'
  description: ''
  required: ['name']
  default:
    content: ''
    startDate: Date.now
    query: {}
    product: 'codecombat'
    kind: 'normal'

# c.extendNamedProperties AnnouncementSchema # do we need name/slug ?

_.extend AnnouncementSchema.properties,
  created: c.date
    title: 'Created'
    readOnly: true
  name:
    title: 'Title' # we can't use a property named title
    type: 'string'
  content:
    type: 'string'
  startDate: c.stringDate()
  endDate: c.stringDate() #unset for forever
  query:
    $ref: '#/definitions/mongoFindQuery'
  product:
    type: 'string'
    enum: ['ozaria', 'codecombat', 'both']
  kind:
    type: 'string'
    enum: ['normal', 'sequence', 'banner']
    description: 'normal: normal announcements; banner: show anyway during live dates on homeview ; sequence: requires step to determine when to show'
  sequence:
    type: 'object'
    description: 'properties: step*, prevStep, prevTime'
    properties:
      prevStep:
        type: 'number'
        description: 'requires first reading at least one prev Step announcement'
      prevTime:
        type: 'number'
        description: 'how many hours required after read prev announcement'
      step:
        type: 'number'
        description: 'announcement publish step'

AnnouncementSchema.definitions = {}
AnnouncementSchema.definitions['mongoQueryOperator'] = MongoQueryOperatorSchema
AnnouncementSchema.definitions['mongoFindQuery'] = MongoFindQuerySchema
c.extendBasicProperties AnnouncementSchema, 'announcement'
c.extendSearchableProperties AnnouncementSchema
c.extendTranslationCoverageProperties AnnouncementSchema
c.extendPatchableProperties AnnouncementSchema

module.exports = AnnouncementSchema
