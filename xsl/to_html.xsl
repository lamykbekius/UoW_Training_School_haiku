<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:html="http://www.w3.org/1999/xhtml" version="1.0">
    <xsl:output method="html" media-type="text/html" encoding="UTF-8" indent="no" version="4.0"/>
    <xsl:preserve-space elements="*"/>
    <xsl:param name="sequences" select="//*/@seq"/>
    <xsl:param name="css-path" select="''"/>
    <xsl:template match="tei:TEI">

            
                
               
                    <div class="row">
                        <div class="col-lg-5 col-md-4">
                            
                            <div class="description">
                                <h2 align="left">
                                    <xsl:value-of select="//tei:titleStmt/tei:author"/>
                                    <xsl:text> - </xsl:text>
                                    <xsl:text>"</xsl:text>
                                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                                    <xsl:text>"</xsl:text>
                                </h2>
                                <h3 align="left">
                                    <xsl:text>Session </xsl:text>
                                    <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'session']"/>
                                </h3>
                                <ul class="list-unstyled">
                                    <xsl:apply-templates select="//tei:head"/>
                                    <ul class="list-unstyled">
                                        <li>
                                            <xsl:text>Date: </xsl:text>
                                            <xsl:value-of select="//tei:sourceDesc/tei:p/tei:l[1]"/>
                                        </li>
                                        <li>
                                            <xsl:text>Start time: </xsl:text>
                                            <xsl:value-of select="//tei:sourceDesc/tei:p/tei:l[2]"/>
                                        </li>
                                        <li>
                                            <xsl:text>Duration: </xsl:text>
                                            <xsl:value-of select="//tei:sourceDesc/tei:p/tei:l[3]"/>
                                        </li>
                                        <li>
                                            <xsl:text>Progression: </xsl:text>
                                            <xsl:text>session-version </xsl:text>
                                            <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'version']"/>
                                            <xsl:text>/</xsl:text>
                                            <xsl:value-of select="//tei:publicationStmt/tei:p[@corresp = 'total_versions']"/>
                                        </li>
                                    </ul>
                                </ul>
                                <h4>About the writing session:</h4>
                                <p>
                                    <xsl:apply-templates select="//tei:sourceDesc/tei:p[@n = 'description']"/>
                                </p>
                                <ul>
                                    <li> Total number of writing operations: <xsl:value-of select="count(//tei:mod[@type = 'continue'] | //tei:add[@type = 'context'] | //tei:add[@type = 'nt'] | //tei:add[@type = 'pre-context'] | //tei:add[@type = 'typo'] | //tei:add[@type = 'translocation'] | //tei:del[@type = 'context'] | //tei:del[@type = 'typo'] | //tei:del[@type = 'pre-context'] | //tei:del[@type = 'translocation'])"/>
                                        <!-- Counts all the writing operations, except visiting sources and the continuation of writing actions (e.g., type="context|continue"), and puts it in a list item -->
                                    </li>
                                    <li style="color: #843371"> Number of newly added sentences:
                                        <xsl:value-of select="count(//*[@type = 'nt'])"/>
                                    </li>
                                    <li style="color: #ff9900"> Number of returns to unfinished
                                        sentences: <xsl:value-of select="count(//tei:mod[@type = 'continue'])"/>
                                    </li>
                                    <li style="color: #377495"> Number of translocations:
                                        <xsl:value-of select="count(//tei:add[@type = 'translocation'])"/>
                                    </li>
                                    <li> Number of contextual revisions: <xsl:value-of select="count(//tei:*[@type = 'context'])"/>
                                        <ul>
                                            <li style="color: #04724D"> contextual additions:
                                                <xsl:value-of select="count(//tei:add[@type = 'context'])"/>
                                            </li>
                                            <li style="color: #B20D30"> contextual deletions:
                                                <xsl:value-of select="count(//tei:del[@type = 'context'])"/>
                                            </li>
                                        </ul>
                                    </li>
                                    <li> Number of pre-contextual revisions: <xsl:value-of select="count(//*[@type = 'pre-context'])"/>
                                        <ul>
                                            <li style="color: #7FB069;">
                                                <xsl:text>pre-contextual additions: </xsl:text>
                                                <xsl:value-of select="count(//tei:add[@type = 'pre-context'])"/>
                                            </li>
                                            <li style="color: #F35376">
                                                <xsl:text>pre-contextual deletions: </xsl:text>
                                                <xsl:value-of select="count(//tei:del[@type = 'pre-context'])"/>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <xsl:text>Number of typos: </xsl:text>
                                        <xsl:value-of select="count(//*[@type = 'typo'])"/>
                                        <ul>
                                            <li style="color: #BE7C4D">
                                                <xsl:text>typo related additions: </xsl:text>
                                                <xsl:value-of select="count(//tei:add[@type = 'typo'])"/>
                                            </li>
                                            <li style="color: #875531">
                                                <xsl:text>typo related deletions: </xsl:text>
                                                <xsl:value-of select="count(//tei:del[@type = 'typo'])"/>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <xsl:text>Number of times sources were consulted: </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'focus'])"/>
                                    </li>
                                    <li>
                                        <xsl:text>Number of direct copies from sources: </xsl:text>
                                        <xsl:value-of select="count(//tei:add[@type = 'source'])"/>
                                    </li>
                                </ul>
                                
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-7 word">
                            
                            <xsl:apply-templates select="//tei:body/tei:p"/>
                        </div>
                        <div class="col-lg-1 col-md-1">
                            <div class="sticky-top">
                                <div style="text-align: center;">
                                    Replay the session:
                                </div>
                                <p>
                                    <span style="font-size:24px;cursor: pointer;" class="fa start_btn">&#9205;</span>
                                    <span onclick="stop()" style="font-size:24px;cursor: pointer;float: right;" class="fa stop_btn">&#9208;</span>
                                </p>
                                <p>
                                    <span style="font-size:24px;cursor: pointer;" class="fa" id="countButton">&#10094;</span>
                                    <span style="font-size:24px;cursor: pointer;float: right;" class="fa increase_btn">&#10095;</span>
                                </p>
                                <div style="text-align: center;">
                                    <span style="font-size:24px;cursor: pointer" class="material-icons refresh_btn">⟲</span>
                                </div>
                                <p id="demo" style="text-align: center;"/>
                            </div>
                        </div>
                        
                    </div>
                    
        <script type="application/javascript">var rev = $(".add, .del, .cont, .chap").length;
        console.log(rev)</script>
                
            

    </xsl:template>
    
    
    <xsl:template match="//tei:teiHeader"/>
    
    <xsl:template match="//tei:sourceDesc">
        <p class="description">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="//tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
  
    
    <xsl:template match="//tei:p">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:lb">
        <br xmlns="http://www.w3.org/1999/xhtml" style="display:none"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//tei:lb[@type = 'indent']">
        <br xmlns="http://www.w3.org/1999/xhtml" style="display:none"/>
        <span xmlns="http://www.w3.org/1999/xhtml" class="indent"/>
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="//tei:lb[@type = 'whiteline']">
        <br xmlns="http://www.w3.org/1999/xhtml"/>
        <xsl:apply-templates/>
        <span xmlns="http://www.w3.org/1999/xhtml" class="whiteline"/>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:emph[@rend = 'italics']">
        <i xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="//tei:emph[@rend = 'bold']">
        <b xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="//tei:title">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="//tei:distinct[@rend = 'small-text']">
        <p xmlns="http://www.w3.org/1999/xhtml" style="font-size: 83%;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'nt']">
        <span xmlns="http://www.w3.org/1999/xhtml" class="add nt">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">★</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
            <xsl:apply-templates/>
            <i class="symbol">★</i>
        </span>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>

    <xsl:template match="//tei:add[@type = 'source']">
        <span xmlns="http://www.w3.org/1999/xhtml" class="add src">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">★</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
            <xsl:apply-templates/>
            <i class="symbol">★</i>
        </span>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'nt|continue']">
        <span xmlns="http://www.w3.org/1999/xhtml" class="add nt">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
            <xsl:apply-templates/>
            <i class="symbol">★</i>
        </span>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'rt']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add rt">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'rt|continue']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add rt">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:mod[@type = 'continue']">
        <q xmlns="http://www.w3.org/1999/xhtml" class="cont">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">☆</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
            <xsl:apply-templates/>
            <i class="symbol">☆</i>
        </q>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:mod[@type = 'continue|continue']">
        <q xmlns="http://www.w3.org/1999/xhtml" class="cont">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">☆</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
            <xsl:apply-templates/>
            <i class="symbol">☆</i>
        </q>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
   
    
    <xsl:template match="//tei:del[@type = 'context']">
        <s xmlns="http://www.w3.org/1999/xhtml" class="del context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">▷</i>
            <xsl:apply-templates/>
            <i class="symbol">▷</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </s>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'context|continue']">
        <s xmlns="http://www.w3.org/1999/xhtml" class="del context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">▷</i>
            <xsl:apply-templates/>
            <i class="symbol">▷</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </s>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    
    <xsl:template match="//tei:del[@type = 'pre-context']">
        <s xmlns="http://www.w3.org/1999/xhtml" class="del pre-context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">◁</i>
            <xsl:apply-templates/>
            <i class="symbol">◁</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </s>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'pre-context|continue']">
        <s xmlns="http://www.w3.org/1999/xhtml" class="del pre-context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">◁</i>
            <xsl:apply-templates/>
            <i class="symbol">◁</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </s>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'context']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">►</i>
            <xsl:apply-templates/>
            <i class="symbol">►</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'context|continue']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">►</i>
            <xsl:apply-templates/>
            <i class="symbol">►</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'interdoc']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add interdoc">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <span class="n sup">
            <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'interdoc']">
        <del xmlns="http://www.w3.org/1999/xhtml" class="del interdoc">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </del>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="//tei:add[@type = 'pre-context']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add pre-context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">◀</i>
            <xsl:apply-templates/>
            <i class="symbol">◀</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'pre-context|continue']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add pre-context">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">◀</i>
            <xsl:apply-templates/>
            <i class="symbol">◀</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="//tei:del[@type = 'typo']">
        <del xmlns="http://www.w3.org/1999/xhtml" class="del typo">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">△</i>
            <xsl:apply-templates/>
            <i class="symbol">△</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </del>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    
    <xsl:template match="//tei:add[@type = 'typo']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add typo">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">▲</i>
            <xsl:apply-templates/>
            <i class="symbol">▲</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    
    <xsl:template match="//tei:add[@type = 'typo|continue']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add typo">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">▲</i>
            <xsl:apply-templates/>
            <i class="symbol">▲</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:del[@type = 'translocation']">
        <s xmlns="http://www.w3.org/1999/xhtml" class="del trans">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">✧</i>
            <xsl:apply-templates/>
            <i class="symbol">✧</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </s>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    
    <xsl:template match="//tei:del[@type = 'translocation|continue']">
        <s xmlns="http://www.w3.org/1999/xhtml" class="del trans">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">✧</i>
            <xsl:apply-templates/>
            <i class="symbol">✧</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </s>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    <xsl:template match="//tei:add[@type = 'translocation']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add trans">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">✦</i>
            <xsl:apply-templates/>
            <i class="symbol">✦</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//tei:add[@type = 'translocation|continue']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add trans">
            <xsl:attribute name="id">
        <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">✦</i>
            <xsl:apply-templates/>
            <i class="symbol">✦</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
   
    
    <xsl:template match="//tei:add[@type = 'focus']">
        <span xmlns="http://www.w3.org/1999/xhtml" class="add focus">
            <xsl:attribute name="id">
            <xsl:value-of select="@n"/>
            </xsl:attribute>
            <i class="symbol">✦</i>
            <xsl:apply-templates/>
            <i class="symbol">✦</i>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </span>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    
    
    
    <xsl:template match="//tei:add[@type = 'layout']">
        <ins xmlns="http://www.w3.org/1999/xhtml" class="add layout" style="color: #fff;display: none">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>.</ins>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:time">
        (<xsl:apply-templates/>)
    </xsl:template>
    
    
    <xsl:template match="//tei:del[@type = 'layout']">
        <s xmlns="http://www.w3.org/1999/xhtml" class="del layout">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <span class="n sup">
                <xsl:value-of select="@n"/>
            </span>
        </s>
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//tei:metamark">
        
        <xsl:if test="@ana">
            <b>
                <xsl:attribute name="class">notes note<xsl:value-of select="@ana"/>
                </xsl:attribute>
                <i class="fa fa-pencil-square-o"/>
                <xsl:value-of select="@ana"/>
            </b>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <div>
            <xsl:attribute name="class">notes note<xsl:value-of select="@corresp"/>
        </xsl:attribute>
        <b> <xsl:value-of select="@corresp"/>
            </b>-
        <xsl:apply-templates/>
        </div>
        <br/>
    </xsl:template>

</xsl:stylesheet>