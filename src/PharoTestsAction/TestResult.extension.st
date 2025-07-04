Extension { #name : 'TestResult' }

{ #category : '*PharoTestsAction' }
TestResult >> runCase: aTestCase block: aBlock [
	[ 
		aTestCase announce: TestCaseStarted withResult: self.
		aTestCase runCaseManaged.
		aTestCase announce: TestCaseEnded withResult: self.
		self addPass: aTestCase
	] on: self class failure , self class skip, self class warning, self class error do: [ :ex |
		ex sunitAnnounce: aTestCase toResult: self.
		ex processActionBlock: aBlock test: aTestCase.
	]
]
